package com.mrhmt.controller;

import com.mrhmt.entity.FileModel;
import com.mrhmt.entity.Product;
import com.mrhmt.repository.CategoryRepository;
import com.mrhmt.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
    private static final Logger LOGGER = Logger.getLogger(ProductController.class.getName());

    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    ServletContext context;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() {
        LOGGER.log(Level.INFO, "info:{0}");
        return new ModelAndView("/product/index", "listProduct", productRepository.findAll());
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView create(ModelMap model) {
        model.put("listCate", categoryRepository.findAll());
        return new ModelAndView("/product/create", "product", new Product());
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(@Valid @ModelAttribute("product") Product product, BindingResult result, @Validated FileModel file, ModelMap mm) throws IOException {
        if (result.hasErrors()) {
            mm.put("listCate", categoryRepository.findAll());
            return "/product/create";
        }

        MultipartFile multipartFile = file.getFile();
        String uploadPath = context.getRealPath("") + File.separator + "WEB-INF" + File.separator + "hinhanh" + File.separator;
        System.out.println("Ne: " + uploadPath);
        FileCopyUtils.copy(file.getFile().getBytes(), new File(uploadPath+file.getFile().getOriginalFilename()));
        String fileName = multipartFile.getOriginalFilename();

        product.setThumbnail(fileName);

        productRepository.save(product);
        return "redirect:index";
    }

    @RequestMapping(value = "/details", method = RequestMethod.GET)
    public ModelAndView details(@RequestParam("id")int id){
        return new ModelAndView("/product/details", "product", productRepository.findOne(id));
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam("id") int id, ModelMap model) {
        model.put("listCate", categoryRepository.findAll());
        return new ModelAndView("/product/edit", "product", productRepository.findOne(id));
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String edit(@Valid @ModelAttribute("product") Product product, BindingResult result, ModelMap mm) {
        if (result.hasErrors()) {
            return "error";
        }

        productRepository.save(product);
        return "redirect:index";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam("id") int id) {
        productRepository.delete(id);

        return "redirect:index";
    }

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String test() {
        return "redirect:index";
    }
}
