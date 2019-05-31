package com.ht.zsy.utils;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Author:dfgsd
 * @Description:
 * @Date:2018/7/22 16:24
 */
public class UploadImageUtil {
    public static String uploadImage(HttpServletRequest request,MultipartFile file){
        InputStream is = null;
        OutputStream os = null;
        String path = "";
        try {
            String pathRoot = request.getSession().getServletContext().getRealPath("");
            String uploadPath = "/static/uploadImage/";
            String fileName =file.getOriginalFilename();
            fileName=fileName.substring(fileName.lastIndexOf(".") + 1);
            String newfileName = new SimpleDateFormat("yyy-MM-dd-HH-mm-ss").format(new Date((new Long(String.valueOf(new Date().getTime()))))) + UUIDUtils.getUUID() + "." + fileName;
            path = uploadPath + newfileName;
            //创建file实例
            File uploadImage = new File(pathRoot + path);
            if (!uploadImage.getParentFile().exists()) {
                uploadImage.getParentFile().mkdirs();
            }
            file.transferTo(uploadImage);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return path;
    }

    public static String uploadViedo(HttpServletRequest request,MultipartFile file){
        String path = "";
        try {
            String pathRoot = request.getSession().getServletContext().getRealPath("");
            String uploadPath = "/static/uploadViedo/";
            String fileName = file.getOriginalFilename();
                    fileName=fileName.substring(fileName.lastIndexOf(".") + 1);
            String newfileName = new SimpleDateFormat("yyy-MM-dd-HH-mm-ss").format(new Date((new Long(String.valueOf(new Date().getTime()))))) + UUIDUtils.getUUID() + "." + fileName;
            path = uploadPath + newfileName;
            //创建file实例
            File uploadViedo = new File(pathRoot + path);
            if (!uploadViedo.getParentFile().exists()) {
                uploadViedo.getParentFile().mkdirs();
            }
            file.transferTo(uploadViedo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return path;
    }

    public static String uploadPdf(HttpServletRequest request,MultipartFile file, String fileName){
        String path = "";
        try {
            String pathRoot = request.getSession().getServletContext().getRealPath("");
            String uploadPath = "/static/uploadPdf/";
            fileName = fileName.substring(fileName.lastIndexOf(".") + 1);
            String newfileName = new SimpleDateFormat("yyy-MM-dd-HH-mm-ss").format(new Date((new Long(String.valueOf(new Date().getTime()))))) + UUIDUtils.getUUID() + "." + fileName;
            path = uploadPath + newfileName;
            //创建file实例
            File uploadPPT = new File(pathRoot + path);
            if (!uploadPPT.getParentFile().exists()) {
                uploadPPT.getParentFile().mkdirs();
            }
            file.transferTo(uploadPPT);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return path;
    }



    public static void deleteFile(String path){
        File file = new File(path);
        if (!file.isDirectory()) {
            file.delete();
        } else if (file.isDirectory()) {
            String[] filelist = file.list();
            for (int i = 0; i < filelist.length; i++) {
                File delFile = new File(path + "\\" + filelist[i]);
                if (!delFile.isDirectory()) {
                    delFile.delete();
                    System.out.println(delFile.getAbsolutePath() + "删除文件成功");
                } else if (delFile.isDirectory()) {
                    deleteFile(path + "\\" + filelist[i]);
                }
            }
            System.out.println(file.getAbsolutePath() + "删除成功");
            file.delete();
        }

    }

}
