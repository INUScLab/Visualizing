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
		int numPerBlock = 10; //페이지 개수
		int currentPageSetup;
		int page;
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage==0 || totalPage==0)//데이터가 없으면 아무것도 출력 안함
			return "";
		
		if(listUrl.indexOf("?")!=-1) //주소에 다른 변수가 있으면
			listUrl = listUrl + "&"; //&로 변수를 추가하고
		else
			listUrl = listUrl + "?"; //없으면 ?로 변수 추가
		
		
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock; //현재 page block 구하기 (ex 11 12 13 ~19)
		if(currentPage%numPerBlock==0)
			currentPageSetup = currentPageSetup-numPerBlock;
		
		if(totalPage>numPerBlock && currentPageSetup>0){					//이전 링크 생성
			sb.append("<li><button onclick=\"pagePass("+ currentPageSetup +")\"><i class=\"fa fa-chevron-left\"></i></button></li>");
		}
		
		page = currentPageSetup + 1;
		
		while(page<=totalPage && page<=(currentPageSetup+numPerBlock)){		//각 페이지 별 링크 생성
			if(page==currentPage){	//현재 페이지 굵은 글씨체
				sb.append("<li><button onclick=\"pagePass(" + page + ")\"><b>" + page + "</b></button></li>");
			}else{	//일반 페이지
				sb.append("<li><button onclick=\"pagePass(" + page + ")\">" + page + "</button></li>");
			}
			
			page++;
			
		}
		
		if(totalPage-currentPageSetup>numPerBlock){						//다음 링크 생성
			sb.append("<li><button onclick=\"pagePass("+ page +")\"><i class=\"fa fa-chevron-right\"></i></button></li>");	
		}
		
		return sb.toString();
	}
}
