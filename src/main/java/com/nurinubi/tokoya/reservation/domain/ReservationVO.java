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
	
	private String reservationId;
	private String reservationDate;
	private String reservationStatus;
	private String courseId;
	private String userId;
	private String stylistId;
	
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
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ReservationVO [reservationId=");
		builder.append(reservationId);
		builder.append(", reservationDate=");
		builder.append(reservationDate);
		builder.append(", reservationStatus=");
		builder.append(reservationStatus);
		builder.append(", courseId=");
		builder.append(courseId);
		builder.append(", userId=");
		builder.append(userId);
		builder.append(", stylistId=");
		builder.append(stylistId);
		builder.append("]");
		return builder.toString();
	}
	
	
}
