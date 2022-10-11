package com.board.dao;

import java.lang.reflect.Array;
import java.util.ArrayList;

import com.board.vo.BoardVO;

public class BoardDAO extends DBConn {
	// 찾기로 아래 키워드로 채널 검색
	// 1.board-list 2.board-content 3.board-delete 4.board-write 5.board-update
	
	// 업데이트 확인용
	
	
	//------------------------------------------------------------------------
	//							1.board-list								 -
	//------------------------------------------------------------------------
	
	/**
	 * list 내용을 불러오는 메소드
	 */
	
	public ArrayList<BoardVO> select(int startCount, int endCount) {
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		String sql ="select rno, bid, id, btitle, bhits, blikes, bdate"
				+ " from (select rownum rno, bid, id, btitle, bhits, blikes, to_char(bdate, 'yyyy-mm-dd') bdate"
				+ " from (select bid, id, btitle, bhits,blikes, bdate from board_list"
				+ " order by bdate desc))"
				+ " where rno between  ? and ?";
			
		
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, startCount);
			pstmt.setInt(2, endCount);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setRno(rs.getInt(1));
				vo.setBid(rs.getString(2));
				vo.setId(rs.getString(3));
				vo.setBtitle(rs.getString(4));
				vo.setBhits(rs.getInt(5));
				vo.setBlikes(rs.getInt(6));
				vo.setBdate(rs.getString(7));
				
				list.add(vo);
			}
			close();
		
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 *  totlaCount 페이지 처리를 위한 게시물의 총 갯수를 얻는 메소드
	 */
	public int totalCount() {
		int result = 0;
		String sql = "select count(*) from board_list";
		
		try {
			getPreparedStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	/**
	 * search
	 * 검색조건 파라미터 time-기간, writer- 작성자 및 내용, keyword-검색값 
	 * sqlday,sqlwriter 조건에 따른 sql 호출문
	 * 
	 */
	public ArrayList<BoardVO> search(int startCount, int endCount,String time,String writer,String keyword,String id) {
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		
		// 파라미터값에 따른 호출문 세팅
		String sqlday = "";
		String sqlwriter = "";
		
		if(time == "time-all") {
			sqlday ="";
		}else if(time.equals("time-1day")) {
			sqlday=" and bdate between sysdate-1 and sysdate+1 ";
		}else if(time == "time-1week") {
			sqlday=" and bdate between sysdate-7 and sysdate+1 ";
		}else if(time == "time-1month") {
			sqlday=" and bdate between sysdate-30 and sysdate+1 ";
		}else if(time == "time-6month") {
			sqlday=" and bdate between sysdate-180 and sysdate+1 ";
		}else if(time == "time-1year") {
			sqlday=" and bdate between sysdate-365 and sysdate+1 ";
		}
		if(writer.equals("title")) {
			sqlwriter = "btitle";
		}else if(writer.equals("writer")){
			sqlwriter = "id";
		}else if(writer.equals("content")){
			sqlwriter = "bcontent";
		}else if(writer == "comment"){
			sqlwriter = "where bcomment like '%"+keyword+" %'";
		}else if(writer == "content-comment"){
			sqlwriter = "where bcontent like '%"+keyword+" %' and  bcomment like'%"+keyword+"%";
		}else if(writer == "comment-writer"){
		}
		
		String sql ="select rno, bid, id, btitle, bhits, blikes, bdate"
				+ " from (select rownum rno, bid, id, btitle, bhits, blikes, to_char(bdate, 'yyyy-mm-dd') bdate"
				+ " from (select bid, id, btitle, bhits,blikes, bdate from board_list where "+sqlwriter+" like '%"+ keyword+"%'" + sqlday
				+ " order by bdate desc))"
				+ " where rno between  ? and ?";
			
		
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, startCount);
			pstmt.setInt(2, endCount);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setRno(rs.getInt(1));
				vo.setBid(rs.getString(2));
				vo.setId(rs.getString(3));
				vo.setBtitle(rs.getString(4));
				vo.setBhits(rs.getInt(5));
				vo.setBlikes(rs.getInt(6));
				vo.setBdate(rs.getString(7));
				
				list.add(vo);
			}
			close();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	
	/**
	 * searchcount
	 * 검색조건 파라미터 time-기간, writer- 작성자 및 내용, keyword-검색값 
	 * sqlday,sqlwriter 조건에 따른 sql 호출문
	 * 페이지처리를 위한 조건에 따른 게시물 갯수를 출력 
	 */
	public int searchCount(String time,String writer,String keyword,String id) {
		int result = 0;
		
		
		String sqlday = "";
		String sqlwriter = "";
		
		
		if(time == "time-all") {
			sqlday ="";
		}else if(time.equals("time-1day")) {
			sqlday=" and bdate between sysdate-1 and sysdate+1 ";
		}else if(time == "time-1week") {
			sqlday=" and bdate between sysdate-7 and sysdate+1 ";
		}else if(time == "time-1month") {
			sqlday=" and bdate between sysdate-30 and sysdate+1 ";
		}else if(time == "time-6month") {
			sqlday=" and bdate between sysdate-180 and sysdate+1 ";
		}else if(time == "time-1year") {
			sqlday=" and bdate between sysdate-365 and sysdate+1 ";
		}
		
		if(writer.equals("title")) {
			sqlwriter = "btitle";
		}else if(writer.equals("writer")){
			sqlwriter = "id";
		}else if(writer.equals("content")){
			sqlwriter = "bcontent";
		}else if(writer == "comment"){
			sqlwriter = "bcomment like '%"+keyword+" %'";
		}else if(writer == "content-comment"){
			sqlwriter = " bcontent like '%"+keyword+" %' and  bcomment like'%"+keyword+"%";
		}else if(writer == "comment-writer"){
		}
		
		
		String sql = "select count(*) from board_list where "+sqlwriter+" like '%"+ keyword+"%'"+ sqlday;
		try {
			getPreparedStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	//------------------------------------------------------------------------
	//							2.board-content								 -
	//------------------------------------------------------------------------
	
	/**
	 *	content
	 *	컨텐츠 내용 호출 메서드 
	 */
	public BoardVO content(String bid) {
		BoardVO vo = new BoardVO();
		String sql ="select bid,id, btitle, bcontent, bhits, blikes, to_char(bdate,'yy/mm/dd') bdate from board_list where bid = ?";
		
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, bid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo.setBid(rs.getString(1));
				vo.setId(rs.getString(2));
				vo.setBtitle(rs.getString(3));
				vo.setBcontent(rs.getString(4));		
				vo.setBhits(rs.getInt(5));
				vo.setBlikes(rs.getInt(6));
				vo.setBdate(rs.getString(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return vo;
	}
	
	/**
	 *  bhits
	 *  컨텐츠 조회수 증가
	 */
	public void updatebhits(String bid) {
		String sql = "update board_list set bhits = bhits+1 where bid = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, bid);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	

	/**
	 *  comment_write
	 *  작성된 코멘트 출력
	 */
	public int comment_write(BoardVO vo,String id) {
		int result = 0;
		String sql ="insert into "+vo.getBid()+" values(sequ_"+vo.getBid()+".nextval, 1, sequ_group_"+vo.getBid()+".nextval,?,?,0,'visible',sysdate) ";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, vo.getCcomment());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 *  comment_count
	 *  코멘트 갯수 출력
	 */
	public int comment_count(String bid) {
		int comment_count = 0;
		String sql ="select count(*)from "+bid+" where cvisible = 'visible'";
		try {
			getPreparedStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				comment_count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return comment_count;
	}
	
	/**
	 *  comment_write
	 *  작성된 코멘트를 array에 담아서 출력
	 */
	public ArrayList<BoardVO> comment_list(String bid) {
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
	
		
		String sql ="select cseq, cdept, cgroup, cid, ccomment ,clikes, cvisible, to_char(cdate,'yy/mm/dd') from "+bid+" where cvisible = 'visible' or cvisible = 'delete' order by cgroup, cseq asc";
		try {
			getPreparedStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setCseq(rs.getInt(1));
				vo.setCdept(rs.getInt(2));
				vo.setCgroup(rs.getInt(3));
				vo.setCid(rs.getString(4));
				vo.setCcomment(rs.getString(5));
				vo.setClikes(rs.getInt(6));
				vo.setCvisible(rs.getString(7));
				vo.setCdate(rs.getString(8));
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			return list;
	}
	
	/**
	 * like_check
	 * 게시물 좋아요 갯수 카운트
	 */
	public ArrayList<BoardVO> like_check(String bid,String id){
		ArrayList<BoardVO> like = new ArrayList<BoardVO>();
		String sql ="select cseq from "+bid+" where cid=? and cvisible='like' order by cseq";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setCseq(rs.getInt(1));
				like.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return like;
	}
	
	/**
	 * 리코멘트 등록 
	 */
	public int write_recomment(BoardVO vo,String id) {
		int result = 0;
		String sql="insert into "+vo.getBid()+" values(sequ_"+vo.getBid()+".nextval, 0, "+vo.getCgroup()+",?,?,0,'visible',sysdate)";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, vo.getCcomment());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 코멘트 삭제
	 */
	public int comment_delete(String bid,int cgroup) {
		int result = 0;
		String sql ="delete "+bid+" where cgroup="+cgroup;
		try {
			getPreparedStatement(sql);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 리코멘트 삭제
	 */
	public int recomment_delete(String bid,int cseq) {
		int result = 0;
		System.out.println("작동");
		String sql ="delete "+bid+" where cseq="+cseq;
		try {
			getPreparedStatement(sql);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 코멘트 수정
	 */
	public int comment_edit(BoardVO vo) {
		int result = 0;
		String sql ="update "+vo.getBid()+" set ccomment=? where cseq=?";
		
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getCcomment());
			pstmt.setInt(2, vo.getCseq());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 코멘트 좋아요
	 */
	public String comment_like(int cseq,String id,int cgroup,String bid) {
		String result = "";
		String sql ="insert into "+bid+" values(?,2,?,?,'like',0,'like',sysdate)";
		int pstmtset = 0;
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, cseq);
			pstmt.setInt(2, cgroup);
			pstmt.setString(3, id);
			
			pstmtset = pstmt.executeUpdate();
			if(pstmtset == 1) {
				BoardDAO dao = new BoardDAO();
				result = dao.comment_like_rise(cseq,bid);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 코멘트 안좋요
	 */
	public String comment_unlike(int cseq,String id,int cgroup,String bid) {
		String result = "";
		String sql ="delete from "+bid+" where cid = ? and cseq =? and cvisible='like'";
		int pstmtset = 0;
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, cseq);
			
			pstmtset = pstmt.executeUpdate();
			if(pstmtset == 1) {
				BoardDAO dao = new BoardDAO();
				result = dao.comment_like_down(cseq,bid);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 좋아요 올리기
	 */
	public String comment_like_rise(int cseq,String bid) {
		String result = "";
		int pstmt_set = 0;
		String sql ="update "+bid+" set clikes = clikes+1 where cseq = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, cseq);
			pstmt_set = pstmt.executeUpdate();
			if(pstmt_set == 1) {
				result = "done";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 좋아요 내리기
	 */
	public String comment_like_down(int cseq,String bid) {
		String result = "";
		int pstmt_set = 0;
		String sql ="update "+bid+" set clikes = clikes-1 where cseq = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, cseq);
			pstmt_set = pstmt.executeUpdate();
			if(pstmt_set == 1) {
				result = "done";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//------------------------------------------------------------------------
	//							3.board-delete								 -
	//------------------------------------------------------------------------
	
	/**
	 * delete
	 * 게시물 삭제를 위한 메소드
	 * 게시물에 관련된 comment테이블, 시퀀스테이블 제거 메소드 호출
	 */
	public int delete(String bid) {//-------------------------------------------------------------글쓰기
		int result = 0;
		String sql = "delete from board_list where bid = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, bid);
			result = pstmt.executeUpdate();
				if(result == 1) {
					BoardDAO dao = new BoardDAO();
					dao.drop_comment(bid);
					dao.drop_sequ(bid);
					dao.drop_sequ_group(bid);
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 *	drop_comment
	 *	게시물과 연결된 comment 테이블 삭제 
	 */
	public void drop_comment(String bid) {
		String sql  ="drop table "+bid;
		try {
			getPreparedStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 *	drop_sequ
	 *	게시물과 연결된 sequence 테이블 삭제 
	 */
	public void drop_sequ(String bid) {
		String sql  ="drop sequence sequ_"+bid;
		try {
			getPreparedStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 *	drop_sequ
	 *	게시물과 연결된 group_sequence 테이블 삭제 
	 */
	public void drop_sequ_group(String bid) {
		String sql  ="drop sequence sequ_group_"+bid;
		try {
			getPreparedStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//------------------------------------------------------------------------
	//							4.board-write								 -
	//------------------------------------------------------------------------
	
	/**
	 * write_board
	 * 	게시물 등록을 위한 메소드
	 */
	public int write_board(BoardVO vo,String id) {
		int result = 0;
		String sql = "insert into board_list values('b_'||sequ_board_list.nextval,?,?,?,null,null,0,0,sysdate)";
		
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, vo.getBtitle());
			pstmt.setString(3, vo.getBcontent());
			
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
		
	/**
	 * write_select 
	 * 생성된 게시물의 bid값을 얻는 메소드 
	 */
	public BoardVO write_select() {//-----------------------------------게시글 생성후 bid 값 얻기
		String sql = "select rno, bid, id, btitle, bcontent, bhits, blikes, bdate"
				+ " from (select rownum rno, bid, id, btitle, bcontent, bhits, blikes, to_char(bdate, 'yyyy-mm-dd') bdate"
				+ " from (select bid,id, btitle, bcontent, bhits,blikes, bdate from board_list"
				+ " order by bdate desc))"
				+ " where rno = 1";
		BoardVO vo = new BoardVO();
		try {
			getPreparedStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo.setRno(rs.getInt(1));
				vo.setBid(rs.getString(2));
				vo.setId(rs.getString(3));
				vo.setBtitle(rs.getString(4));
				vo.setBcontent(rs.getString(5));
				vo.setBhits(rs.getInt(6));
				vo.setBlikes(rs.getInt(7));
				vo.setBdate(rs.getString(8));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo; 
	}
	
	/**
	 *  comment_table
	 *  생성된 게시물에 해당하는 comment 테이블 생성
	 */
	public int create_table(BoardVO vo) {
		int result = 0; 
		String sql = "create table "+vo.getBid()+"("
				+ "	   CSEQ NUMBER(4),"
				+ "    CDEPT NUMBER(2),"
				+ "    CGROUP NUMBER(4),"
				+ "    CID VARCHAR2(100) NOT NULL,"
				+ "    ccomment VARCHAR2(500) NOT NULL,"
				+ "    CLIKES NUMBER(4),"
				+ "    CVISIBLE VARCHAR(10),"
				+ "    CDATE DATE"
				+ ")";
		try {
			getPreparedStatement(sql);
			pstmt.executeUpdate();
			BoardDAO dao = new BoardDAO();
			dao.create_sequ(vo.getBid());
			dao.create_sequ_group(vo.getBid());
			result  = dao.comment_first_set(vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * create_sequ
	 * 코멘트 테이블의 시퀀스 생성
	 */
	public void create_sequ(String bid){
		String sql = "CREATE SEQUENCE SEQU_"+bid
				+ "    START WITH 1"
				+ "    INCREMENT BY 1";
		try {
			getPreparedStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * create_sequ_group
	 * 코멘트 그룹테이블의 시퀀스 생성
	 */
	public void create_sequ_group(String bid){
		String sql = "CREATE SEQUENCE SEQU_group_"+bid
				+ "    START WITH 1"
				+ "    INCREMENT BY 1";
		try {
			getPreparedStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	*  comment_first_set
	*  생성된 comment테이블에 기초값 등록
	*  creat_table에서 호출됨
	*/
	public int comment_first_set(BoardVO vo) {//---------------------------코멘트 초기값 설정
		int result = 0;
		String sql = "insert into "+vo.getBid()+" values(sequ_"+vo.getBid()+".nextval, 1, sequ_group_"+vo.getBid()+".nextval,?,'main',0,'main',sysdate)";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getId());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//--------------------------------------------------------------------코멘트 초기값 설정
	
	
	
	//------------------------------------------------------------------------
	//							5.board-update								 -
	//------------------------------------------------------------------------
	
	public int update(BoardVO vo) {
		int result = 0;
		String sql ="update board_list set btitle=?, bcontent=? where bid =?";
		
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getBtitle());
			pstmt.setString(2, vo.getBcontent());
			pstmt.setString(3, vo.getBid());
			
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
}