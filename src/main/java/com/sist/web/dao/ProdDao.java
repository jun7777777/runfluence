package com.sist.web.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sist.web.model.Prod;
import com.sist.web.model.VariantsOptionValue;

@Repository("prodDao")
public interface ProdDao 
{
	public List<Prod> prodList(Prod prod);
	
	public long prodListCount(Prod prod); 
	
	public Prod detailProdView(Prod prod);
	
	public List<VariantsOptionValue> optionCntList(String prodId);
	
	public List<VariantsOptionValue> optionListView(String prodId);
	
	public List<VariantsOptionValue> sizeListView(String prodId);
	
	public List<VariantsOptionValue> colorListView(String prodId);
	
	public List<Prod> popularityProd(String userEmail);
}
