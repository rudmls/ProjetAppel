package com.example.projetappel.controller;

import static com.example.projetappel.util.Constants.*;
import static com.example.projetappel.util.ContentType.*;

import com.example.projetappel.dao.FichierDao;
import com.example.projetappel.enumtype.Role;
import com.example.projetappel.model.Etudiant;
import com.example.projetappel.model.Fichier;
import com.example.projetappel.model.Utilisateur;
import com.example.projetappel.service.GoogleDriveService;
import com.example.projetappel.util.ContentType;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "JustificatifController", value = "/compte/justificatif")
public class JustificatifController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("page", "justificatif");
        request.getRequestDispatcher("/view/compte/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (ServletFileUpload.isMultipartContent(request)) {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(MEMORY_THRESHOLD);
            factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setFileSizeMax(MAX_FILE_SIZE);
            upload.setSizeMax(MAX_REQUEST_SIZE);
            upload.setHeaderEncoding(HEADER_ENCODING);
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            try {
                List<FileItem> formItems = upload.parseRequest(request);
                if (formItems != null && formItems.size() > 0) {
                    for (FileItem item : formItems) {
                        if (!item.isFormField() && Objects.equals(item.getFieldName(), "fichier")) {
                            String fileName = item.getName();
                            String fileContentType = item.getContentType();
                            if (!Objects.equals(fileContentType, APPLICATION_PDF)) {
                                request.setAttribute("fichier_erreur", "Veuillez déposer un fichier au format \".pdf\"");
                                doGet(request, response);
                                break;
                            } else {
                                Etudiant etudiant = (Etudiant) request.getAttribute("utilisateur");
                                FichierDao fichierDao = new FichierDao();
                                Fichier fichier = new Fichier(fileName, fileContentType);
                                // création du fichier dans la base de donnée
                                int fichierId = fichierDao.create(fichier);
                                String driveId = GoogleDriveService.createDirectory(String.valueOf(fichierId));

                                // création du fichier sur le serveur
                                String filePath = uploadPath + File.separator + fichierId + fileName;
                                File storeFile = new File(filePath);
                                item.write(storeFile);
//                                String fileId = GoogleDriveService.createFile(fileName, fileContentType, new File(filePath));
                                request.setAttribute("message", "File " + fileName + " has uploaded successfully!");
                            }
                        }
                    }
                } else {
                    request.setAttribute("fichier_erreur", "Veuillez renseigner un document justificatif");
                    doGet(request, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private void processRequest() {


//        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
//        File uploadDir = new File(uploadPath);
//        if (!uploadDir.exists()) uploadDir.mkdir();
//
//        File file;
//        HashMap<String, String> erreurs = new HashMap<>();
//        String libelle = request.getParameter("libelle");
//
//        if (libelle == null || libelle.isEmpty()) {
//            erreurs.put("libelle_erreur", "Veillez renseigner le libellé");
//        }
//
//        String contentType = request.getContentType();
//
//        if (contentType.contains("multipart/form-data")) {
//            DiskFileItemFactory factory = new DiskFileItemFactory();
//            factory.setSizeThreshold(MEMORY_THRESHOLD);
//            factory.setRepository(new File("c:\\temp"));
//            ServletFileUpload upload = new ServletFileUpload(factory);
//            upload.setSizeMax(MAX_FILE_SIZE);
//            upload.setHeaderEncoding("UTF-8");
//
//            try {
//                List fileItems = upload.parseRequest(request);
//                Iterator iterator = fileItems.iterator();
//                while (iterator.hasNext()) {
//                    FileItem fileItem = (FileItem) iterator.next();
//                    if (!fileItem.isFormField()) {
//                        String fieldName = fileItem.getFieldName();
//                        String fileName = fileItem.getName();
//                        boolean isInMemery = fileItem.isInMemory();
//                        long sizzInBytes = fileItem.getSize();
//                        file = new File("");
//                        file = new File("");
//                    }
//                }
//            } catch (FileUploadException e) {
//                e.printStackTrace();
//            }
//        }
    }
}