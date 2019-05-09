package com.dcits.ensemble.om.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

/**
 * @ClassName: FilesUtiles
 * @Description: java类作用描述
 * @Author: liyuq
 * @CreateDate: 2019/5/7 18:53
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Component
public class FilesUtiles {
    public static void writeFiles(String filePath,String sql,String filename){
        //文件目录
        String sqls = sql;
        Path rootLocation = Paths.get(filePath);
        try {
            if(Files.notExists(rootLocation)){
                Files.createDirectories(rootLocation);
            }
            Path path = rootLocation.resolve(filename);
            if(path.toFile().exists()){
                Files.write(path , sqls.getBytes(),StandardOpenOption.APPEND);
            }else {
                Files.write(path , sqls.getBytes());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static Boolean isTableFile(String filePath,String filename){
        Path rootLocation = Paths.get(filePath);
        try {
            if(Files.notExists(rootLocation)){
                Files.createDirectories(rootLocation);
            }
            Path path = rootLocation.resolve(filename);
            if(path.toFile().exists()){
               return true;
            }else {
               return false;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void DeteleFile(String filePath,String filename){
        Path rootLocation = Paths.get(filePath);
            if(Files.notExists(rootLocation)){
                return;
            }
            Path path = rootLocation.resolve(filename);
            if(path.toFile().exists()){
                path.toFile().delete();
            }
    }
}
