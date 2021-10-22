/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.service;

import com.nth.pojos.Category;
import java.util.List;

/**
 *
 * @author Hieu
 */
public interface CategoryService {
    List<Category> getCategories();
    Category getCategoryById(int id);
    
}
