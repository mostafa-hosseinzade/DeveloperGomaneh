/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JsfClass;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.annotation.PostConstruct;
import javax.inject.Named;
import javax.enterprise.context.RequestScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import org.apache.commons.io.FileUtils;
import org.primefaces.extensions.model.fluidgrid.FluidGridItem;
import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.StreamedContent;

/**
 *
 * @author nima
 */
@Named(value = "fileBrowser")
@RequestScoped
public class FileBrowser {

    private List<FluidGridItem> images;
    private List<String> files;
    private String search;

    @PostConstruct
    protected void initialize() {
        images = new ArrayList<>();
        ExternalContext externalContext = FacesContext.getCurrentInstance().getExternalContext();
        String newFileName = externalContext.getRealPath("") + "/resources/images";
        if (!(new File(newFileName)).exists()) {
            return;
        }
        for (File f : (List<File>) FileUtils.listFiles(new File(newFileName), new String[]{"jpg", "jpeg", "png", "gif"}, true)) {
            images.add(new FluidGridItem(f.getName()));
        }
        String fileName = externalContext.getRealPath("") + "/resources/public";
        File dir = new File(fileName);
        if (!(dir).exists()) {
            return;
        }
        files = new ArrayList<>();
        File[] fileList = dir.listFiles();
        for (File f : fileList) {
            files.add(f.getName());
        }
    }

    public String getCkeditorUrl() {
        String path = null;
        ExternalContext externalContext = FacesContext.getCurrentInstance().getExternalContext();
        Map<String, String> param = externalContext.getRequestParameterMap();
        if (param != null) {
            path = param.get("CKEditorFuncNum");
            System.out.println(path);
        }
        return path;
    }

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    public FileBrowser() {
    }

    public List<FluidGridItem> getImages() {
        return images;
    }

    public void setImages(List<FluidGridItem> images) {
        this.images = images;
    }

    public StreamedContent downloadPdfFull(String filename) throws FileNotFoundException, IOException {
        File file = new File("/images/" + filename);
        if (file.exists()) {
            return new DefaultStreamedContent(new FileInputStream(file), Files.probeContentType(file.toPath()), filename, "UTF-8");
        }
        return null;
    }

    public List<String> getFiles() {

        if (search != null && !search.isEmpty()) {
            List<String> list = new ArrayList<>();
            if (files != null) {
                for (String s : files) {
                    if (s.contains(search)) {
                        list.add(s);
                    }
                }
                return list;
            }
        }
        return files;
    }

    public void setFiles(List<String> files) {
        this.files = files;
    }

}
