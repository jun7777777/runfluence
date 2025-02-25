package com.sist.web.model;

import java.io.Serializable;

public class User implements Serializable {
  private static final long serialVersionUID = 1L;

  private String userEmail; // 유저 이메일
  private String userPwd; // 유저 비밀번호
  private String userName; // 유저 이름
  private String userTel; // 유저 전화번호
  private String userJumin; // 유저 주민등록번호
  private String userStatus; // 유저 상태
  private String userRegDate; // 유저 가입일
  private String userGender; // 유저 성별
  private String userGrade; // 유저 등급

  private String userProfileImg; // 유저 프로필 이미지
  private String userProfileIntro; // 유저 프로필 소개

  public User() {
    userEmail = "";
    userPwd = "";
    userName = "";
    userTel = "";
    userJumin = "";
    userStatus = "";
    userRegDate = "";
    userGender = "";
    userGrade = "";
    userProfileImg = "";
    userProfileIntro = "";

  }

  public String getUserEmail() {
    return userEmail;
  }

  public void setUserEmail(String userEmail) {
    this.userEmail = userEmail;
  }

  public String getUserPwd() {
    return userPwd;
  }

  public void setUserPwd(String userPwd) {
    this.userPwd = userPwd;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getUserTel() {
    return userTel;
  }

  public void setUserTel(String userTel) {
    this.userTel = userTel;
  }

  public String getUserJumin() {
    return userJumin;
  }

  public void setUserJumin(String userJumin) {
    this.userJumin = userJumin;
  }

  public String getUserStatus() {
    return userStatus;
  }

  public void setUserStatus(String userStatus) {
    this.userStatus = userStatus;
  }

  public String getUserRegDate() {
    return userRegDate;
  }

  public void setUserRegDate(String userRegDate) {
    this.userRegDate = userRegDate;
  }

  public String getUserGender() {
    return userGender;
  }

  public void setUserGender(String userGender) {
    this.userGender = userGender;
  }

  public String getUserGrade() {
    return userGrade;
  }

  public void setUserGrade(String userGrade) {
    this.userGrade = userGrade;
  }

  public String getUserProfileImg() {
    return userProfileImg;
  }

  public void setUserProfileImg(String userProfileImg) {
    this.userProfileImg = userProfileImg;
  }

  public String getUserProfileIntro() {
    return userProfileIntro;
  }

  public void setUserProfileIntro(String userProfileIntro) {
    this.userProfileIntro = userProfileIntro;
  }

}