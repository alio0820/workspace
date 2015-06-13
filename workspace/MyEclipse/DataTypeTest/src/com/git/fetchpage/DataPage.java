package com.git.fetchpage;

import java.util.List;

public class DataPage {
	
	private int datasetSize;
    private int startRow;
    private List data;
	public List getData() {
		return data;
	}
	public void setData(List data) {
		this.data = data;
	}
	public int getDatasetSize() {
		return datasetSize;
	}
	public void setDatasetSize(int datasetSize) {
		this.datasetSize = datasetSize;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	
	public DataPage(int datasetSize, int startRow, List data)
    {
        this.datasetSize = datasetSize;
        this.startRow = startRow;
        this.data = data;
    }

}
