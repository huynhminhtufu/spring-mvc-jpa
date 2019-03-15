package com.mrhmt.controller;

import com.mrhmt.entity.Category;
import com.mrhmt.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
@RequestMapping(value = "/cate")
public class CategoryController {
    private static final Logger LOGGER = Logger.getLogger(CategoryController.class.getName());

    @Autowired
    private CategoryRepository categoryRepository;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() {
        LOGGER.log(Level.INFO, "info:{0}");
        return new ModelAndView("/cate/index","listCate",categoryRepository.findAll());
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView create(){
        return new ModelAndView("/cate/create", "cate", new Category());

    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(@Valid @ModelAttribute("cate") Category category,
                         BindingResult result, ModelMap model){
        if(result.hasErrors()){
            return "error";
        }
        categoryRepository.save(category);
        return "redirect:index";
    }

    @RequestMapping(value = "/details", method = RequestMethod.GET)
    public ModelAndView details(@RequestParam("id")int id){
        return new ModelAndView("/cate/details", "cate", categoryRepository.findOne(id));
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam("id") int id){
        return new ModelAndView("/cate/edit", "cate", categoryRepository.findOne(id));
    }

    @RequestMapping(value = "edit", method = RequestMethod.POST)
    public String edit(@Valid @ModelAttribute("cate") Category category,
                       BindingResult result, ModelMap model){
        if(result.hasErrors()){
            return "error";
        }
        categoryRepository.save(category);
        return "redirect:index";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam("id") int id){
        categoryRepository.delete(id);
        return "redirect:index";
    }

    @RequestMapping(value = "/deleteAll", method = RequestMethod.GET)
    public String deleteAll(){
        categoryRepository.deleteAll();
        return "redirect:index";
    }
}
