package com.nurinubi.tokoya.sample.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nurinubi.tokoya.sample.repository.SampleRepository;

@Controller
public class SampleController {
		
	@Autowired
	private SampleRepository sampleRepository;
	
	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
	
	@RequestMapping(value = "/sample", method = RequestMethod.GET)
	public String sample(Model model) {
		logger.info("SampleController");
		
        model.addAttribute("result", sampleRepository.getUserList());
		System.out.println(model);
		return "sample/home";
	}
}
