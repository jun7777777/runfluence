package com.sist.web.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.sist.web.model.ShippingAddr;
import com.sist.web.model.User;

@Repository
public interface UserDao {

  public User userSelect(String userEmail);

  public int userInsert(User user);

  public String userEmailFind(Map<String, String> params);

  public String userPwdFind(User user);

  public int userPwdupdate(User user);

  public String userNameFind(User user);

  public int userNameupdate(User user);

  public int userTelupdate(User user);

  public int userProfileImgch(User user);

  public int userProfileImgDel(User user);

  public int userProfileIntro(User user);

  public int userDel(User user);

  // 임윤한 작성 : 사용자 배송지 삽입
  public int userAddrInsert(ShippingAddr shippingAddr);

  // 임윤한 작성 : 사용자 배송지 리스트
  public List<ShippingAddr> userAddrList(String userEmail);

  // 임윤한 작성 : 사용자 기본 배송지 조회
  public ShippingAddr userDefaultAddrSelect(String userEmail);

  public int userAddrupdate(ShippingAddr shippingAddr);
  
  public String findIsDefault(ShippingAddr shippingAddr);
  
  public int addrSoftDel(ShippingAddr shippingAddr);
  
  public short findMinShippingAddrNum(ShippingAddr shippingAddr);
  
  public int setDefaultAddr(ShippingAddr shippingAddr);
  
  public int resetDefault(ShippingAddr shippingAddr);

}