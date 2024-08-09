package BEAN;

public class Error {
	private int errorId;
	private String errorType;
	private String errorDesc;
	private String errorOccurrenceTime;
	public Error() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Error(int errorId, String errorType, String errorDesc, String errorOccurrenceTime) {
		super();
		this.errorId = errorId;
		this.errorType = errorType;
		this.errorDesc = errorDesc;
		this.errorOccurrenceTime = errorOccurrenceTime;
	}
	public String getErrorOccurrenceTime() {
		return errorOccurrenceTime;
	}
	public void setErrorOccurrenceTime(String errorOccurrenceTime) {
		this.errorOccurrenceTime = errorOccurrenceTime;
	}
	public int getErrorId() {
		return errorId;
	}
	public void setErrorId(int errorId) {
		this.errorId = errorId;
	}
	public String getErrorType() {
		return errorType;
	}
	public void setErrorType(String errorType) {
		this.errorType = errorType;
	}
	public String getErrorDesc() {
		return errorDesc;
	}
	public void setErrorDesc(String errorDesc) {
		this.errorDesc = errorDesc;
	}	
}
