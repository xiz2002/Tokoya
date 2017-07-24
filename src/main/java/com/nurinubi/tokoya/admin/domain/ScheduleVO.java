package com.nurinubi.tokoya.admin.domain;

/**
 * @ClassName : AdminVO.java
 * @Description : 
 * @
 * @		修正日			修正者			修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017. 7. 21.		Kim				最初作成
 * @		
 * @author Kim
 * @since 2017
 * @version 0.1
 *  Copyright (C) by NuriNubi All right reserved.
 */

public class ScheduleVO {
	
//スタイリスト
private String scheduleId;
private String stylistId;
private String offDate;

public String getScheduleId() {
	return scheduleId;
}

public void setScheduleId(String scheduleId) {
	this.scheduleId = scheduleId;
}

public String getStylistId() {
	return stylistId;
}

public void setStylistId(String stylistId) {
	this.stylistId = stylistId;
}

public String getOffDate() {
	return offDate;
}

public void setOffDate(String offDate) {
	this.offDate = offDate;
}

/**
 * @return the stylistId
 */

/* (non-Javadoc)
 * @see java.lang.Object#toString()
 */
@Override
public String toString() {
	StringBuilder builder = new StringBuilder();
	builder.append("ScheduleVO [scheduleId=");
	builder.append(scheduleId);
	builder.append(", stylistId=");
	builder.append(stylistId);
	builder.append(", offDate=");
	builder.append(offDate);
	builder.append(", getClass()=");
	builder.append(getClass());
	builder.append(", hashCode()=");
	builder.append(hashCode());
	builder.append(", toString()=");
	builder.append(super.toString());
	builder.append("]");
	return builder.toString();
}
}
