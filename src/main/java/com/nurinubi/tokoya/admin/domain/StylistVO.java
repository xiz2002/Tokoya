package com.nurinubi.tokoya.admin.domain;

/**
<!--
 * 
 * @ClassName : SampleVO.java
=======
/**
<!--
 * 
 * @ClassName : AdminVO.java
>>>>>>> fe01d9d732c9bd127aada6e209fa50cedf823274
 * @Description : 
 * @
 * @		修正日			修正者			修正内容
 * @ 	---------		---------		-------------------------------
<<<<<<< HEAD
 * @ 	2017. 7. 13.		Kim			最初作成
 * 
 * @author Kim
=======
 * @ 	2017. 7. 13.		山木雄矢			最初作成
 * 
 * @author 山木雄矢
>>>>>>> fe01d9d732c9bd127aada6e209fa50cedf823274
 * @since 2017
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
 */

public class StylistVO {
	
//スタイリスト
private String stylistId;
private String stylistName;
private String stylistStatus;



/**
 * @return the stylistId
 */
public String getStylistId() {
	return stylistId;
}
/**
 * @param stylistid the stylistid to set
 */
public void setStylistId(String stylistId) {
	this.stylistId = stylistId;
}
/**
 * @return the stylistname
 */
public String getStylistName() {
	return stylistName;
}
/**
 * @param stylistname the stylistname to set
 */
public void setStylistName(String stylistName) {
	this.stylistName = stylistName;
}
/**
 * @return the stylistname
 */
public String getStylistStatus() {
	return stylistStatus;
}
/**
 * @param stylistname the stylistname to set
 */
public void setStylistStatus(String stylistStatus) {
	this.stylistStatus = stylistStatus;
}
/* (non-Javadoc)
 * @see java.lang.Object#toString()
 */
@Override
public String toString() {
	StringBuilder builder = new StringBuilder();
	builder.append("StylistVO [stylistid=");
	builder.append(stylistId);
	builder.append(", stylistName=");
	builder.append(stylistName);
	builder.append(", stylistStatus=");
	builder.append(stylistStatus);
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
