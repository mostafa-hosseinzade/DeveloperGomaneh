/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Login;

import Entity.User;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.faces.bean.ManagedBean;
import JsfClass.util.JsfUtil;
import Bean.UserFacade;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.context.FacesContext;

@ManagedBean
@SessionScoped
public class LoginController implements Serializable {

    private String username;
    private String password = "";
    @EJB
    private UserFacade userFacade;
    private List<User> users = new ArrayList<>();

    private User user;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String createHash(String input) throws NoSuchAlgorithmException {
        MessageDigest m = MessageDigest.getInstance("SHA-256");
        m.update(input.getBytes(), 0, input.length());
        return new BigInteger(1, m.digest()).toString(16);
    }

    public String login() throws NoSuchAlgorithmException, IOException {
        this.users = userFacade.findAll();

        for (User u : users) {
            if (username.equals(u.getUsername()) && createHash(password).equals(u.getPassword())) {
                this.user = u;
                u.setLastLogin(new Date());
                userFacade.edit(u);
                break;
            }
        }
        if (user != null) {
            JsfUtil.addSuccessMessage("شما با موفقیت وارد شدید");
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("user", user);
            if (user.getRole().toUpperCase().equals("SUPERADMIN") || user.getRole().toUpperCase().equals("ADMIN")) {
                FacesContext.getCurrentInstance().getExternalContext().redirect(
                        "/DeveloperGomaneh/Admin/?redirect=true");
            }
            if (user.getRole().toUpperCase().equals("USER")) {
                FacesContext.getCurrentInstance().getExternalContext().redirect(
                        "/DeveloperGomaneh/User/status.xhtml?redirect=true");
            }
            return "";
        }
        JsfUtil.addErrorMessage("کاربری با این اطلاعات وجود ندارد");
        return "";
    }

    public boolean checkLogin(String role) throws IOException {
        try {
            // Get user off session
            User u = (User) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("user");
            // Check user not null
            if (u == null) {
                FacesContext.getCurrentInstance().getExternalContext().redirect(
                        "/DeveloperGomaneh/login/login.xhtml?redirect=true");
                return false;
            }
            // Find user in database
            User find = userFacade.find(u.getId());
            if (find == null) {
                FacesContext.getCurrentInstance().getExternalContext().redirect(
                        "/DeveloperGomaneh/login/login.xhtml?redirect=true");
                return false;
            }
            // Check if user role different with role send
            if (!u.getRole().toUpperCase().equals(role.toUpperCase())) {
                // If role equal SuperAdmin return true
                if(u.getRole().toUpperCase().equals("SUPERADMIN")){
                    return true;
                }
                // If role equal user return to user panel
                if (u.getRole().toUpperCase().equals("USER")) {
                    FacesContext.getCurrentInstance().getExternalContext().redirect(
                            "/DeveloperGomaneh/User/status.xhtml?redirect=true");
                    return false;
                }
                // If role not exists
                if (!role.toUpperCase().equals("ADMIN") && !role.toUpperCase().equals("SUPERADMIN")) {
                    FacesContext.getCurrentInstance().getExternalContext().redirect(
                            "/DeveloperGomaneh/login/login.xhtml?redirect=true");
                    return false;
                }
                // If user cant access section
                if (role.toUpperCase().equals("SUPERADMIN") && u.getRole().toUpperCase().equals("ADMIN")) {
                    FacesContext.getCurrentInstance().getExternalContext().redirect("/DeveloperGomaneh/SuperAdmin/");
                    return false;
                }
            }
            // If all things Its ok 
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public void logout() throws IOException {
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().clear();
        FacesContext.getCurrentInstance().getExternalContext().redirect(
                "/DeveloperGomaneh/login/login.xhtml?redirect=true");
    }
}
