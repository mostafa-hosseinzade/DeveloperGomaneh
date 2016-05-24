package JsfClass;

import Entity.Portfolio;
import JsfClass.util.JsfUtil;
import JsfClass.util.JsfUtil.PersistAction;
import Bean.PortfolioFacade;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import java.io.Serializable;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import javax.imageio.ImageIO;
import org.apache.commons.io.FilenameUtils;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.StreamedContent;
import org.primefaces.model.UploadedFile;

@Named("portfolioController")
@SessionScoped
public class PortfolioController implements Serializable {

    @EJB
    private Bean.PortfolioFacade ejbFacade;
    private List<Portfolio> items = null;
    private Portfolio selected;
    private List<UploadedFile> mapFile = new ArrayList();
    private UploadedFile file;

    public PortfolioController() {
    }

    public Portfolio getSelected() {
        return selected;
    }

    public void setSelected(Portfolio selected) {
        this.selected = selected;
    }

    protected void setEmbeddableKeys() {
    }

    protected void initializeEmbeddableKey() {
    }

    private PortfolioFacade getFacade() {
        return ejbFacade;
    }

    public Portfolio prepareCreate() {
        selected = new Portfolio();
        initializeEmbeddableKey();
        return selected;
    }

    public void create() throws IOException {
        String filename = "";
        File dir = new File("/opt/uploads/portfolio");
        if (!dir.exists()) {
            dir.mkdirs();
        }
        Path folder = Paths.get("/opt/uploads/portfolio");
        int i = 1;
        for (UploadedFile file : mapFile) {
            String extension = FilenameUtils.getExtension(file.getFileName());
            String name = i + "_"+System.currentTimeMillis();
            Path path = Paths.get(folder.toString(),name+"." + extension);
            Path outFile = Files.createFile(path);
            try (InputStream input = file.getInputstream()) {
                Files.copy(input, outFile, StandardCopyOption.REPLACE_EXISTING);
                filename += name+"." + extension + ";";
            }
            i++;
        }
        selected.setImg(filename);
        persist(PersistAction.CREATE, ResourceBundle.getBundle("/Bundle3").getString("PortfolioCreated"));
        if (!JsfUtil.isValidationFailed()) {
            items = null;    // Invalidate list of items to trigger re-query.
        }
        this.mapFile.clear();
    }

    public void update() {
        persist(PersistAction.UPDATE, ResourceBundle.getBundle("/Bundle3").getString("PortfolioUpdated"));
    }

    public void destroy() {
        persist(PersistAction.DELETE, ResourceBundle.getBundle("/Bundle3").getString("PortfolioDeleted"));
        if (!JsfUtil.isValidationFailed()) {
            selected = null; // Remove selection
            items = null;    // Invalidate list of items to trigger re-query.
        }
    }

    public List<Portfolio> getItems() {
        if (items == null) {
            items = getFacade().findAll();
        }
        return items;
    }

    private void persist(PersistAction persistAction, String successMessage) {
        if (selected != null) {
            setEmbeddableKeys();
            try {
                if (persistAction != PersistAction.DELETE) {
                    getFacade().edit(selected);
                } else {
                    getFacade().remove(selected);
                }
                JsfUtil.addSuccessMessage(successMessage);
            } catch (EJBException ex) {
                String msg = "";
                Throwable cause = ex.getCause();
                if (cause != null) {
                    msg = cause.getLocalizedMessage();
                }
                if (msg.length() > 0) {
                    JsfUtil.addErrorMessage(msg);
                } else {
                    JsfUtil.addErrorMessage(ex, ResourceBundle.getBundle("/Bundle3").getString("PersistenceErrorOccured"));
                }
            } catch (Exception ex) {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, null, ex);
                JsfUtil.addErrorMessage(ex, ResourceBundle.getBundle("/Bundle3").getString("PersistenceErrorOccured"));
            }
        }
    }

    public Portfolio getPortfolio(java.lang.Integer id) {
        return getFacade().find(id);
    }

    public List<Portfolio> getItemsAvailableSelectMany() {
        return getFacade().findAll();
    }

    public List<Portfolio> getItemsAvailableSelectOne() {
        return getFacade().findAll();
    }

    public UploadedFile getFile() {
        return file;
    }

    public void setFile(UploadedFile file) {
        this.file = file;
    }

    public void addImage(FileUploadEvent event) {
        System.out.println("Reedddyyyy" + event.getFile().getFileName());
        mapFile.add(event.getFile());
    }

    @FacesConverter(forClass = Portfolio.class)
    public static class PortfolioControllerConverter implements Converter {

        @Override
        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            PortfolioController controller = (PortfolioController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "portfolioController");
            return controller.getPortfolio(getKey(value));
        }

        java.lang.Integer getKey(String value) {
            java.lang.Integer key;
            key = Integer.valueOf(value);
            return key;
        }

        String getStringKey(java.lang.Integer value) {
            StringBuilder sb = new StringBuilder();
            sb.append(value);
            return sb.toString();
        }

        @Override
        public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
            if (object == null) {
                return null;
            }
            if (object instanceof Portfolio) {
                Portfolio o = (Portfolio) object;
                return getStringKey(o.getId());
            } else {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "object {0} is of type {1}; expected type: {2}", new Object[]{object, object.getClass().getName(), Portfolio.class.getName()});
                return null;
            }
        }

    }

}
