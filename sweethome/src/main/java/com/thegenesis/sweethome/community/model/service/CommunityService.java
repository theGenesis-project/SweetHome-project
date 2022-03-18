package com.thegenesis.sweethome.community.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.thegenesis.sweethome.common.vo.PageInfo;
import com.thegenesis.sweethome.community.model.vo.Community;
import com.thegenesis.sweethome.community.model.vo.CommunityFile;

public interface CommunityService {
	
	//--리스트 조회 + 페이징
	//공지사항, 정보, 중고장터, 메이트
	
	//게시글 총 개수 조회
	int listCount(int boardType);
	//게시글 리스트 가져오기(통합)
	ArrayList<Community> boardList(PageInfo pi, int BoardType);
	
	//게시글 검색 기능(게시글 개수)
	int searchNoticeCount(HashMap<String, String> map);
	int searchInfoCount(HashMap<String, String> map);
	
	//게시글 검색 기능(게시글 리스트)
	ArrayList<Community> searchNoticeList(PageInfo pi, HashMap<String, String> map);
	ArrayList<Community> searchInfoList(PageInfo pi, HashMap<String, String> map);
	
	//게시글 상세 보기(조회수 증가)
	int increaseCount(int bno);
	
	//게시글 상세보기
	Community boardDetail(int bno);
	
	//게시글 작성하기 
	int insertBoard(Community cm, CommunityFile coFile);
	
	
	//게시글 삭제
	
	//게시글 수정
	
	//댓글 리스트 조회
	
	//댓글 작성
	
	//댓글 수정
	
	//댓글 삭제
	
	//글 신고
	
	//댓글 신고
	
	
	

	

}
