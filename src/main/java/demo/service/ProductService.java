/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package demo.service;

import demo.model.Product;
import demo.repository.ProductRepository;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author OS
 */
@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Transactional
    public List<Product> getAllProduct() {
        return productRepository.getAll();
    }

    public boolean checkIfProductNameExist(Product product) {
        List<Product> products = getAllProduct();
        for (Product pr : products) {
            if (pr.getName().trim().equalsIgnoreCase(product.getName())) {
                return true;
            }
        }
        return false;
    }

    public boolean checkIfUpdatedNameInvalid(Product product) {
        List<Product> products = getAllProduct();
        for (Product pr : products) {
            if (pr.getName().equalsIgnoreCase(product.getName()) && !pr.getId().equals(product.getId())) {
                return true;
            }
        }
        return false;
    }

    public String createNewProductID() {
        List<Product> products = getAllProduct();
        List<String> productIdList = new ArrayList<String>();
        Integer numId = 1;
        for (Product product : products) {
            if (numId == Integer.valueOf(product.getId().substring(2))) {
                numId++;
            } else {
                break;
            }
        }
        if (numId > 999) {
            return null;
        }

        return "PR" + String.format("%03d", numId);
    }

    @Transactional
    public void saveProduct(Product product, MultipartFile image) throws IOException {
        if (!image.getOriginalFilename().equals("")) {
            String fileName = StringUtils.cleanPath(image.getOriginalFilename());
            String uploadDir = "./src/main/webapp/resources/product_img/" + product.getId();
            Path uploadPath = Paths.get(uploadDir);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }
            InputStream inputStream = image.getInputStream();
            Path filePath = uploadPath.resolve(fileName);
            System.out.println("File path: " + filePath.toFile().getAbsolutePath());
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
        }
        productRepository.saveOrUpdate(product);
    }

    @Transactional
    public Product getProductById(String id) {
        return productRepository.getById(id);
    }

    public void updateProduct(Product product, MultipartFile image) throws IOException {
        if (!image.getOriginalFilename().equals("") && !image.getOriginalFilename().equals(product.getImg())) {
            product.setImg(image.getOriginalFilename());
            
            String fileName = StringUtils.cleanPath(image.getOriginalFilename());
            String uploadDir = "./src/main/webapp/resources/product_img/" + product.getId();
            Path uploadPath = Paths.get(uploadDir);
            if (Files.exists(uploadPath)) {
                File file = new File(uploadDir);
                deleteFiles(file);
//                file.delete();
            }
            InputStream inputStream = image.getInputStream();
            Path filePath = uploadPath.resolve(fileName);
            System.out.println("File path: " + filePath.toFile().getAbsolutePath());
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
        }
        productRepository.saveOrUpdate(product);
    }

    //delete all file in a directory
    public static void deleteFiles(File dirPath) {
        File filesList[] = dirPath.listFiles();
        for (File file : filesList) {
            if (file.isFile()) {
                file.delete();
            } else {
                deleteFiles(file);
            }
        }
    }

    //delete an entire directory
    public static void deleteDirectory(File dirPath) {
        for (File subfile : dirPath.listFiles()) {
            if (subfile.isDirectory()) {
                deleteDirectory(subfile);
            }
            subfile.delete();
        }
    }
}
