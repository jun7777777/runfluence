package com.sist.web.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.web.dao.ProdDao;
import com.sist.web.model.Prod;
import com.sist.web.model.VariantsOptionValue;

@Service("prodService")
public class ProdService {
	public static Logger logger = LoggerFactory.getLogger(ProdService.class);

	@Autowired
	private ProdDao prodDao;

	public List<Prod> prodList(Prod prod) {
		List<Prod> list = null;

		try {
			list = prodDao.prodList(prod);
		}

		catch (Exception e) {
			logger.error("[ProdService] prodList Exception", e);
		}

		return list;
	}

	public long prodListCount(Prod prod) {
		long count = 0;

		try {
			count = prodDao.prodListCount(prod);
		}

		catch (Exception e) {
			logger.error("[ProdService] prodListCount Exception", e);
		}

		return count;
	}

	public Prod detailProdView(Prod prod) {
		Prod proddetail = null;

		try {
			proddetail = prodDao.detailProdView(prod);
		}

		catch (Exception e) {
			logger.error("[ProdService] detailProdView Exception", e);
		}

		return proddetail;
	}

	public List<VariantsOptionValue> optionCntList(String prodId) {
		List<VariantsOptionValue> list = null;

		try {
			list = prodDao.optionCntList(prodId);
		}

		catch (Exception e) {
			logger.error("[ProdService] optionCntList Exception", e);
		}

		return list;
	}

	public List<VariantsOptionValue> optionListView(String prodId) {
		List<VariantsOptionValue> list = null;

		try {
			list = prodDao.optionListView(prodId);
		}

		catch (Exception e) {
			logger.error("[ProdService] optionListView Exception", e);
		}

		return list;
	}

	public List<VariantsOptionValue> sizeListView(String prodId) {
		List<VariantsOptionValue> sizeList = null;

		try {
			sizeList = prodDao.sizeListView(prodId);
		}

		catch (Exception e) {
			logger.error("[ProdService] sizeListView Exception", e);
		}

		return sizeList;
	}

	public List<VariantsOptionValue> colorListView(String prodId) {
		List<VariantsOptionValue> colorList = null;

		try {
			colorList = prodDao.colorListView(prodId);
		}

		catch (Exception e) {
			logger.error("[ProdService] colorListView Exception", e);
		}

		return colorList;
	}
	
	public List<Prod> popularityProd(String userEmail)
	{
		List<Prod> list = null;
		
		try 
		{
			list = prodDao.popularityProd(userEmail);
		} 
		
		catch (Exception e) 
		{
			logger.error("[ProdService] popularityProd Exception", e);
		}
		
		return list;
	}

}