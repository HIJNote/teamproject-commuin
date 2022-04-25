package com.commuin.paging;

public class PageMaker {
	
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 5;
	private int page; // 현재 페이지 번호
	private int perPageNum; // 한 페이지당 보여줄 게시글의 갯수
	private int end;
	

	
//////////////////
	
	//마지막페이지
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
	public int getPageStart() { // 특정 페이지의 게시글 시작 번호, 게시글 시작 행 번호
		return (this.page - 1) * perPageNum;
	}
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
		} else {
			this.page = page;
		}
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		
		this.perPageNum = perPageNum;
	}

	public void setTotalCount(int totalCount) {
		end=totalCount / getPerPageNum()+1;
		this.totalCount = totalCount;
		calcData();
	}

	public int getTotalCount() {
		return totalCount;
	}

	private void calcData() {
		
			endPage = (int) (Math.ceil(getPage() / (double) displayPageNum) * displayPageNum);

			startPage = (endPage - displayPageNum) + 1;
			if (startPage <= 0) {
				startPage = 1;
			}

			int tempEndPage = (int) (Math.ceil(totalCount / (double) getPerPageNum()));
			if (endPage > tempEndPage) {
				endPage = tempEndPage;
			}

			prev = startPage == 1 ? false : true;
			next = endPage * getPerPageNum() < totalCount ? true : false;
			
		
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage="
				+ endPage + ", prev=" + prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", page="
				+ page + ", perPageNum=" + perPageNum + "]";
	}
	
}
