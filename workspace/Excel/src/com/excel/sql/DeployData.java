package com.excel.sql;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

public class DeployData {
	private File fileOut;

	public void excute(String filepath) {
		fileOut = new File(filepath);
		this.deployUserInfoData();
	}

	public void deployUserInfoData() {
		try {
			new OperExcel(fileOut, "project_copy", Object.class, "Sheet1");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
