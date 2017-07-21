package com.nurinubi.tokoya.reservation.domain;

/**
<!--
 * 
 * @ClassName : ReservationVO.java
 * @Description : ReservationVO Class
 * @
 * @		修正日			修正者			修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017. 7. 14.		李　多　浩			最初作成
 * 
 * @author 李　多　浩
 * @since 2017
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
 */

public class ReservationVO {
	
	private String userId;
	private String userName;
	private String courseId;
	private String courseName;
	private String coursePrice;
	private String courseTime;
	private String reservationId;
	private String reservationDate;
	private String reservationStartTime;
	private String reservationEndTime;
	private String reservationDateTime;
	private String reservationEndDateTime;
	private String reservationStatus;
	private String stylistId;
	private String stylistName;
	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}
	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * @return the courseId
	 */
	public String getCourseId() {
		return courseId;
	}
	/**
	 * @param courseId the courseId to set
	 */
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	/**
	 * @return the courseName
	 */
	public String getCourseName() {
		return courseName;
	}
	/**
	 * @param courseName the courseName to set
	 */
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	/**
	 * @return the coursePrice
	 */
	public String getCoursePrice() {
		return coursePrice;
	}
	/**
	 * @param coursePrice the coursePrice to set
	 */
	public void setCoursePrice(String coursePrice) {
		this.coursePrice = coursePrice;
	}
	/**
	 * @return the courseTime
	 */
	public String getCourseTime() {
		return courseTime;
	}
	/**
	 * @param courseTime the courseTime to set
	 */
	public void setCourseTime(String courseTime) {
		this.courseTime = courseTime;
	}
	/**
	 * @return the reservationId
	 */
	public String getReservationId() {
		return reservationId;
	}
	/**
	 * @param reservationId the reservationId to set
	 */
	public void setReservationId(String reservationId) {
		this.reservationId = reservationId;
	}
	/**
	 * @return the reservationDate
	 */
	public String getReservationDate() {
		return reservationDate;
	}
	/**
	 * @param reservationDate the reservationDate to set
	 */
	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}
	/**
	 * @return the reservationStartTime
	 */
	public String getReservationStartTime() {
		return reservationStartTime;
	}
	/**
	 * @param reservationStartTime the reservationStartTime to set
	 */
	public void setReservationStartTime(String reservationStartTime) {
		this.reservationStartTime = reservationStartTime;
	}
	/**
	 * @return the reservationEndTime
	 */
	public String getReservationEndTime() {
		return reservationEndTime;
	}
	/**
	 * @param reservationEndTime the reservationEndTime to set
	 */
	public void setReservationEndTime(String reservationEndTime) {
		this.reservationEndTime = reservationEndTime;
	}
	/**
	 * @return the reservationDateTime
	 */
	public String getReservationDateTime() {
		return reservationDateTime;
	}
	/**
	 * @param reservationDateTime the reservationDateTime to set
	 */
	public void setReservationDateTime(String reservationDateTime) {
		this.reservationDateTime = reservationDateTime;
	}
	/**
	 * @return the reservationEndDateTime
	 */
	public String getReservationEndDateTime() {
		return reservationEndDateTime;
	}
	/**
	 * @param reservationEndDateTime the reservationEndDateTime to set
	 */
	public void setReservationEndDateTime(String reservationEndDateTime) {
		this.reservationEndDateTime = reservationEndDateTime;
	}
	/**
	 * @return the reservationStatus
	 */
	public String getReservationStatus() {
		return reservationStatus;
	}
	/**
	 * @param reservationStatus the reservationStatus to set
	 */
	public void setReservationStatus(String reservationStatus) {
		this.reservationStatus = reservationStatus;
	}
	/**
	 * @return the stylistId
	 */
	public String getStylistId() {
		return stylistId;
	}
	/**
	 * @param stylistId the stylistId to set
	 */
	public void setStylistId(String stylistId) {
		this.stylistId = stylistId;
	}
	/**
	 * @return the stylistName
	 */
	public String getStylistName() {
		return stylistName;
	}
	/**
	 * @param stylistName the stylistName to set
	 */
	public void setStylistName(String stylistName) {
		this.stylistName = stylistName;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ReservationVO [userId=");
		builder.append(userId);
		builder.append(", userName=");
		builder.append(userName);
		builder.append(", courseId=");
		builder.append(courseId);
		builder.append(", courseName=");
		builder.append(courseName);
		builder.append(", coursePrice=");
		builder.append(coursePrice);
		builder.append(", courseTime=");
		builder.append(courseTime);
		builder.append(", reservationId=");
		builder.append(reservationId);
		builder.append(", reservationDate=");
		builder.append(reservationDate);
		builder.append(", reservationStartTime=");
		builder.append(reservationStartTime);
		builder.append(", reservationEndTime=");
		builder.append(reservationEndTime);
		builder.append(", reservationDateTime=");
		builder.append(reservationDateTime);
		builder.append(", reservationEndDateTime=");
		builder.append(reservationEndDateTime);
		builder.append(", reservationStatus=");
		builder.append(reservationStatus);
		builder.append(", stylistId=");
		builder.append(stylistId);
		builder.append(", stylistName=");
		builder.append(stylistName);
		builder.append("]");
		return builder.toString();
	}
}