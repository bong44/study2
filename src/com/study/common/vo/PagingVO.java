package com.study.common.vo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class PagingVO implements Serializable{
	private int curPage = 1; // 현재 페이지 (def 1)
	private int firstPage; 
	private int lastPage; 
	private int firstRow; 
	private int lastRow;  
	private int totalRowCount; 
	private int totalPageCount; 
	private int rowSizePerPage; 
	private int pageSize = 5; 
}
