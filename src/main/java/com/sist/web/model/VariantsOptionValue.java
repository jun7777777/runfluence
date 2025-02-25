package com.sist.web.model;

import java.io.Serializable;

public class VariantsOptionValue implements Serializable 
{
	private static final long serialVersionUID = 1L;
	
	private String vauleId;
	private String varOptionId;
	private String varOptionName;

	public VariantsOptionValue()
	{
		vauleId = "";
		varOptionId = "";
		varOptionName = "";
	}

	public String getVauleId() {
		return vauleId;
	}

	public void setVauleId(String vauleId) {
		this.vauleId = vauleId;
	}

	public String getVarOptionId() {
		return varOptionId;
	}

	public void setVarOptionId(String varOptionId) {
		this.varOptionId = varOptionId;
	}

	public String getVarOptionName() {
		return varOptionName;
	}

	public void setVarOptionName(String varOptionName) {
		this.varOptionName = varOptionName;
	}
	
}
