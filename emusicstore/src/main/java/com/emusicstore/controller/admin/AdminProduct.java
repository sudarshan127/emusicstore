package com.emusicstore.controller.admin;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Enumeration;

import javax.naming.Binding;
import javax.persistence.Id;

import java.io.IOException;
import java.nio.file.Files;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.PathVariable;

import com.emusicstore.model.Product;
import com.emusicstore.service.ProductService;

@Controller
@RequestMapping(value = "/adminProd")
public class AdminProduct {

	private Path path;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/product/addProduct", method = RequestMethod.GET)
	public String addProduct(Model model) { 
		
		Product product = new Product ();
		
		model.addAttribute("product", product);
		
		return "addProduct";
	}
	
	@RequestMapping(value = "/product/addNewProduct", method = RequestMethod.POST)
	public String addProductPost(HttpServletRequest _request, @ModelAttribute("product") Product product, Model model, BindingResult result) {
		if(result.hasErrors()) {
			System.out.println("In errors");
			System.out.println(result.getErrorCount());
			for(ObjectError err : result.getAllErrors()){
				System.out.println(err.getObjectName());
				System.out.println(err.getDefaultMessage());
				System.out.println(err.getCode());
			}
			return "addProduct";
		}
		
		if(product.getName()==null || product.getName().equals("")){
			System.out.println("Custom error handler" + product.getName());
		try {
			ServletInputStream inputStream = _request.getInputStream();
			byte [] b = new byte[1024];
			inputStream.read(b);
			System.out.println(new String(b));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return "addProduct";
		}
		
		productService.addProduct(product);
		MultipartFile image = product.getImage();
		String rootDirectory =_request.getSession().getServletContext().getRealPath("/");
		path = Paths.get(rootDirectory + "\\WEB-INF\\resources\\images\\" + product.getId() + ".png");
		
		if(image !=null && !image.isEmpty()) {
			try {
				image.transferTo(new File(path.toString()));
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("Product image saving failed", e);
			}
		}
		return "redirect:/admin/productInventory";
	}
	
	@RequestMapping(value = "/product/editProduct/{id}", method = RequestMethod.GET)
	public String editProduct(@PathVariable("id") int id, Model model) { 
		
		Product product = productService.getProductById(id);
		
		model.addAttribute("product", product);
		
		return "editProduct";
	}
	
	@RequestMapping(value = "/product/editProduct", method = RequestMethod.POST)
	public String editProductPost(@Valid @ModelAttribute("product") Product product, BindingResult result, HttpServletRequest request) {
		if(result.hasErrors()) {
			for(ObjectError err : result.getAllErrors()){
				System.out.println(err.getObjectName());
				System.out.println(err.getDefaultMessage());
				System.out.println(err.getCode());
			}
			return "editProduct";
		}
			
		MultipartFile image = product.getImage();
		String rootDirectory =request.getSession().getServletContext().getRealPath("/");
		path = Paths.get(rootDirectory + "\\WEB-INF\\resources\\images\\" + product.getId() + ".png");
		
		if(image !=null && !image.isEmpty()) {
			try {
				image.transferTo(new File(path.toString()));
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("Product image saving failed", e);
			}
		}
		
		productService.editProduct(product);
		return "redirect:/admin/productInventory";
	}
	
	@RequestMapping(value = "/product/deleteProduct/{id}", method = RequestMethod.GET)
	public String deleteProduct(@PathVariable int id, Model model, HttpServletRequest request) { 
		
		String rootDirectory =request.getSession().getServletContext().getRealPath("/");
		path = Paths.get(rootDirectory + "\\WEB-INF\\resources\\images\\" + id + ".png");
		
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		Product product = productService.getProductById(id);
		productService.deleteProduct(product);
		
		return "redirect:/admin/productInventory/";
	}
	
}
