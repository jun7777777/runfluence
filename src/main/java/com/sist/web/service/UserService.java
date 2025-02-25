package com.sist.web.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.web.dao.UserDao;
import com.sist.web.model.ShippingAddr;
import com.sist.web.model.User;

@Service
public class UserService {
  public static Logger logger = LoggerFactory.getLogger(UserService.class);

  @Autowired
  private UserDao userDao;

  public User userSelect(String userEmail) {
    User user = null;

    try {
      user = userDao.userSelect(userEmail);
    } catch (Exception e) {
      logger.error("[userservice] sql Exception userSelect", e);
    }

    return user;
  }

  public int userInsert(User user) {
    int count = 0;

    try {
      count = userDao.userInsert(user);
    } catch (Exception e) {
      logger.error("[userservice] sql Exception userInsert", e);
    }

    return count;
  }

  public String userEmailFind(Map<String, String> params) {
    String userEmail = null;

    try {
      userEmail = userDao.userEmailFind(params);
    } catch (Exception e) {
      logger.error("[userservice] sql Exception userEmailFind", e);
    }

    return userEmail;
  }

  public String userPwdFind(User user) {
    String userPwd = null;

    try {
      userPwd = userDao.userPwdFind(user);
    } catch (Exception e) {
      logger.error("[userservice] sql Exception userPwdFind", e);
    }

    return userPwd;
  }

  public int userPwdupdate(User user) {
    int cnt = 0;

    try {
      cnt = userDao.userPwdupdate(user);
    } catch (Exception e) {
      logger.error("[userservice] sql Exception userPwdupdate", e);
    }

    return cnt;
  }

  public String userNameFind(User user) {
    String userName = null;

    try {
      userName = userDao.userNameFind(user);
    } catch (Exception e) {
      logger.error("[userservice] sql Exception userNameFind", e);
    }

    return userName;
  }

  public int userNameupdate(User user) {

    int count = 0;
    try {
      count = userDao.userNameupdate(user);
    } catch (Exception e) {
      logger.error("[userservice] sql Exception userNameupdate", e);
    }

    return count;
  }

  public int userTelupdate(User user) {
    int count = 0;
    try {
      count = userDao.userTelupdate(user);
    } catch (Exception e) {
      logger.error("[userservice] sql Exception userTelupdate", e);
    }

    return count;
  }

  public int userProfileImgch(User user) {

    int count = 0;
    try {
      count = userDao.userProfileImgch(user);
    } catch (Exception e) {
      logger.error("[userservice] sql Exception userProfileImgch", e);
    }

    return count;
  }

  public int userProfileImgDel(User user) {

    int count = 0;
    try {
      count = userDao.userProfileImgDel(user);
    } catch (Exception e) {
      logger.error("[userservice] sql Exception userProfileImgch", e);
    }

    return count;
  }

  public int userProfileIntro(User user) {

    int count = 0;

    try {
      count = userDao.userProfileIntro(user);
    } catch (Exception e) {
      logger.error("[userservice] sql Exception userProfileImgch", e);
    }

    return count;
  }

  public int userDel(User user) {
    int count = 0;
    try {
      count = userDao.userDel(user);
    } catch (Exception e) {
      logger.error("[userservice] sql Exception userDel", e);
    }
    return count;
  }

  public boolean userAddrInsert(ShippingAddr shippingAddr) {
    int cnt = 0;

    try {
      cnt = userDao.userAddrInsert(shippingAddr);
    } catch (Exception e) {
      logger.error("[UserService] userAddrInsert Exception", e);
    }

    return (cnt == 1);
  }

  // 임윤한 작성 : 사용자 배송지 리스트
  public List<ShippingAddr> userAddrList(String userEmail) {
    List<ShippingAddr> addrList = null;

    try {
      addrList = userDao.userAddrList(userEmail);
    } catch (Exception e) {
      logger.error("[UserService] userAddrList Exception", e);
    }

    return addrList;
  }

  // 임윤한 작성 : 사용자 기본 배송지 조회
  public ShippingAddr userDefaultAddrSelect(String userEmail) {
    ShippingAddr defaultAddr = null;

    try {
      defaultAddr = userDao.userDefaultAddrSelect(userEmail);

    } catch (Exception e) {
      logger.error("[UserService] userDefaultAddrSelect Exception", e);
    }

    return defaultAddr;
  }

  @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
  public int userAddrupdate(ShippingAddr shippingAddr) throws Exception {

    int count = 0;

    if ("Y".equals(shippingAddr.getIsDefault())) {

      userDao.resetDefault(shippingAddr);
    }

    count = userDao.userAddrupdate(shippingAddr);

    return count;
  }

  @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
  public int addrSoftDel(ShippingAddr shippingAddr) throws Exception {

    int count = 0;

    String isDefault = userDao.findIsDefault(shippingAddr);
    boolean wasDefault = "Y".equals(isDefault);

    count = userDao.addrSoftDel(shippingAddr);

    if (wasDefault) {
      Short minAddrNum = userDao.findMinShippingAddrNum(shippingAddr);
      if (minAddrNum != null) {
        ShippingAddr shippingAddrDefault = new ShippingAddr();
        shippingAddrDefault.setShippingAddrNum(minAddrNum);
        shippingAddrDefault.setUserEmail(shippingAddr.getUserEmail());
        userDao.setDefaultAddr(shippingAddrDefault);

      }
    }

    return count;

  }

}
