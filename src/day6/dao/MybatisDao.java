package day6.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import day3.dto.Customer;
import day6.mybatis.SqlSessionBean;

public class MybatisDao {
	
	private static MybatisDao dao = new MybatisDao();
	private MybatisDao() { }
	public static MybatisDao getInstance() {
		return dao;
	}
	
	// 1. 새로운 코딩 : SqlSession 객체를 생성해야합니다. -> 메소드에서. SqlSessionFactory 객체 가져오기
	//		SqlSessionFactory 객체 가져오기
	SqlSessionFactory sqlFactory = SqlSessionBean.getSessionFactory();
	
	public List<Customer> selectAll() {
		List<Customer> list = null;
		// 2. SqlSession 객체 생성하여 sql 실행하기.
		SqlSession mapper = sqlFactory.openSession();
		list = mapper.selectList("selectAll");	// "selectAll" mapper 파일의 id 값과 일치해야합니다.
					//		ㄴ 이 메소드는 리턴타입이 List<Object>, select 조회 결과가 n개 row 일 때
		mapper.close();
		return list;
	}
	
	public Customer select(int idx) {
		Customer cus = null;
		SqlSession mapper = sqlFactory.openSession();
		cus = mapper.selectOne("selectOne", idx);		// 두번째 인자는 sql 실행에 필요한 파라미터입니다.
					//		ㄴ 이 메소드는 리턴 타입이 Object, select 조회 결과가 1row 일 때
		mapper.close();
		return cus;
	}
	
	public int insert(Customer cus) {
		//SqlSession mapper = sqlFactory.openSession(true);	// auto commit 을 true, 기본값 false
		SqlSession mapper = sqlFactory.openSession();
		int n = mapper.insert("insert", cus);	// auto commit? 	n값 확인
		mapper.commit();
		mapper.close();
		return n;
	}
	
}
