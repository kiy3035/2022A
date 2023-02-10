package com.green.pds.vo;

public class FilesVo {
	// Fields
	private int      file_num;
	private int      board_idx;
	private String   filename;
	private String   fileext;
	private String   sfilename;
	
	// Constructor
	public FilesVo() {}
		
	public FilesVo(int file_num, int board_idx, 
			String filename, String fileext, String sfilename) {
		this.file_num = file_num;
		this.board_idx = board_idx;
		this.filename = filename;
		this.fileext = fileext;
		this.sfilename = sfilename;
	}

	// Getter /Setter
	
	public int getFile_num() {
		return file_num;
	}

	public void setFile_num(int file_num) {
		this.file_num = file_num;
	}

	public int getboard_idx() {
		return board_idx;
	}

	public void setboard_idx(int board_idx) {
		this.board_idx = board_idx;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFileext() {
		return fileext;
	}

	public void setFileext(String fileext) {
		this.fileext = fileext;
	}

	public String getSfilename() {
		return sfilename;
	}

	public void setSfilename(String sfilename) {
		this.sfilename = sfilename;
	}

	// toString
	@Override
	public String toString() {
		return "FilesVo [file_num=" + file_num + ", board_idx=" + board_idx + ", filename=" + filename + ", fileext=" + fileext
				+ ", sfilename=" + sfilename + "]";
	}
	
}
