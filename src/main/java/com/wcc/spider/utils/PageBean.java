package com.wcc.spider.utils;

/**
 * PageBean
 *
 * @author wc.choi
 */
public class PageBean {

	private final int pageSize; // �븳 �럹�씠吏��뿉 蹂댁뿬二쇰뒗 row�닔
	private final int viewSize; // �럹�씠吏� 踰덊샇 蹂댁뿬二쇰뒗 媛쒖닔
	private final int pageIndex; // �쁽�옱 �럹�씠吏�
	private int totalRows; // totalrow �닔
	private int startPage;
	private int totalPage;
	private int endPage;
	private boolean isFirstPage;
	private boolean isLastPage; 
	private boolean hasPrevBlock;
	private boolean hasNextBlock;
	
	public PageBean(int pageSize, int pageIndex, int viewSize, int totalRows) {
		this.pageSize = pageSize;
		this.pageIndex = pageIndex;
		this.viewSize = viewSize;
		this.totalRows = totalRows;
				
		this.startPage = (((pageIndex - 1) / viewSize) * viewSize) + 1;
		this.totalPage =  ((totalRows - 1) / pageSize) + 1;
		this.endPage =  (((totalPage - 1) / viewSize) == ((pageIndex - 1) / viewSize)) ? totalPage: ((((pageIndex - 1) / viewSize) * viewSize) + viewSize);
		
		this.isFirstPage = (pageIndex == 1) ? true : false;
		this.isLastPage = (pageIndex == this.totalPage) ? true : false;
		
		this.hasPrevBlock = (this.startPage  > 1) ? true : false;
		this.hasNextBlock = (this.endPage < this.totalPage) ? true : false;
	}
	public int getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public int getViewSize() {
		return viewSize;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public boolean isFirstPage() {
		return isFirstPage;
	}
	public void setFirstPage(boolean isFirstPage) {
		this.isFirstPage = isFirstPage;
	}
	public boolean isLastPage() {
		return isLastPage;
	}
	public void setLastPage(boolean isLastPage) {
		this.isLastPage = isLastPage;
	}
	public boolean isHasPrevBlock() {
		return hasPrevBlock;
	}
	public void setHasPrevBlock(boolean hasPrevBlock) {
		this.hasPrevBlock = hasPrevBlock;
	}
	public boolean isHasNextBlock() {
		return hasNextBlock;
	}
	public void setHasNextBlock(boolean hasNextBlock) {
		this.hasNextBlock = hasNextBlock;
	}	
}