package com.nurinubi.tokoya.admin.domain;

import java.util.Date;

/**
 * <!--
 * 
 * @ClassName : SampleVO.java ======= /** <!--
 * 
 * @ClassName : AdminVO.java >>>>>>> fe01d9d732c9bd127aada6e209fa50cedf823274
 * @Description :
 * @ @ 修正日 修正者 修正内容 @ --------- --------- -------------------------------
 *   <<<<<<< HEAD @ 2017. 7. 13. Kim 最初作成
 * 
 * @author Kim ======= @ 2017. 7. 13. 山木雄矢 最初作成
 * 
 * @author 山木雄矢 >>>>>>> fe01d9d732c9bd127aada6e209fa50cedf823274
 * @since 2017
 * @version 0.1
 *
 *          Copyright (C) by NuriNubi All right reserved. -->
 */

public class AdminVO {

	private String adminId;
	private String adminPass;

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPass() {
		return adminPass;
	}

	public void setAdminPass(String adminPass) {
		this.adminPass = adminPass;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("adminVo [adminId=");
		builder.append(adminId);
		return builder.toString();
	}
}
