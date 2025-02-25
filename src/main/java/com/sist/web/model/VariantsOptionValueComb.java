package com.sist.web.model;

import java.io.Serializable;

public class VariantsOptionValueComb implements Serializable 
{
	private static final long serialVersionUID = 1L;
	
	private String combId;          // VARIANTS_OPTION_VALUE_COMB_ID
    private String prodId;          // PROD_ID
    private int stock;              // VARIANTS_OPTION_VALUE_COMB_STOCK
    private String combText;		// VARIANTS_OPTION_VALUE_COMB_TEXT
    
    public VariantsOptionValueComb()
    {
    	combId = "";
    	prodId = "";
    	stock = 0;
    	combText = "";
    }

	public String getCombId() {
		return combId;
	}

	public void setCombId(String combId) {
		this.combId = combId;
	}

	public String getProdId() {
		return prodId;
	}

	public void setProdId(String prodId) {
		this.prodId = prodId;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getCombText() {
		return combText;
	}

	public void setCombText(String combText) {
		this.combText = combText;
	}
    
}
