package visualizing.util;

public class MyUtil {
	public int getPageCount(int numPerPage, int dataCount){
		int pageCount = 0;
		pageCount = dataCount/numPerPage;
		if(dataCount%numPerPage != 0)
			pageCount++;
		
		return pageCount;
	}
	
	public String pageIndexList(int currentPage,int totalPage, String listUrl){
		int numPerBlock = 10;
		int currentPageSetup;
		int page;
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage==0 || totalPage==0)
			return "";
		
		if(listUrl.indexOf("?")!=-1)
			listUrl = listUrl + "&";
		else
			listUrl = listUrl + "?";
		
		
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
		if(currentPage%numPerBlock==0)
			currentPageSetup = currentPageSetup-numPerBlock;
		
		if(totalPage>numPerBlock && currentPageSetup>0){
			
			sb.append("<li><button onclick=\"pagePass("+ currentPageSetup +")\"><i class=\"fa fa-chevron-left\"></i></button></li>");
			//<a href="list.jsp?pageNum=5">이전</a>*nbsp;
		}
		
		page = currentPageSetup + 1;
		
		while(page<=totalPage && page<=(currentPageSetup+numPerBlock)){
			
			if(page==currentPage){
				sb.append("<li><button onclick=\"pagePass(" + page + ")\"><b>" + page + "</b></button></li>");
			//<font color="Fuchsia">9</font>&nbsp;
				
			}else{
				
				sb.append("<li><button onclick=\"pagePass(" + page + ")\"><b>" + page + "</b></button></li>");
				//<a href="list.jsp?pageNum=6">6</a>&nbsp;
				
			}
			
			page++;
			
		}
		
		if(totalPage-currentPageSetup>numPerBlock){
			
			sb.append("<li><button onclick=\"pagePass("+ page +")\"><i class=\"fa fa-chevron-right\"></i></button></li>");
			//<a href="list.jsp?pageNum=11">다음</a>&nbsp;
			
		}
		
		return sb.toString();
	}
}
