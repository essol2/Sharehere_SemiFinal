package house.model.vo;

public class Search {

   private String shNo;         // 하우스 번호
   private String shTitle;         // 하우스 이름
   private String shType;         // 하우스 유형 (빌라,아파트,단독주택)
   private String shAddress;      // 하우스 주소
   private String shLa;         // 하우스위도
   private String shLo;         // 하우스경도
   private String shSubway;       // 하우스지하철
   private String status;         // 활성화
   private String shRno;         // 방번호
   private String shGender;      // 방의 성별타입
   private int    shCapacity;      // 방의 수용인원 
   private String shI;            // 사진번호
   private String shItype;         // 사진타입
   private String shIpath;         // 사진경로
   private String shChName;      // 변경된사진이름
   
   
   public Search() {}

   
   // 리스트 페이지 수정 
   public Search(String shNo, String shTitle, String shType, String shAddress, String shLa, String shLo,
         String shSubway, String status, String shItype, String shIpath, String shChName) {
      super();
      this.shNo = shNo;
      this.shTitle = shTitle;
      this.shType = shType;
      this.shAddress = shAddress;
      this.shLa = shLa;
      this.shLo = shLo;
      this.shSubway = shSubway;
      this.status = status;
      this.shItype = shItype;
      this.shIpath = shIpath;
      this.shChName = shChName;
   }



   public Search(String shNo, String shTitle, String shType, String shAddress, String shLa, String shLo,
         String shSubway, String status, String shRno, String shGender, int shCapacity, String shI, String shItype, String shIpath,
         String shChName) {
      super();
      this.shNo = shNo;
      this.shTitle = shTitle;
      this.shType = shType;
      this.shAddress = shAddress;
      this.shLa = shLa;
      this.shLo = shLo;
      this.shSubway = shSubway;
      this.status = status;
      this.shRno = shRno;
      this.shGender = shGender;
      this.shCapacity = shCapacity;
      this.shI = shI;
      this.shItype = shItype;
      this.shIpath = shIpath;
      this.shChName = shChName;
   }


   public String getShNo() {
      return shNo;
   }


   public void setShNo(String shNo) {
      this.shNo = shNo;
   }


   public String getShTitle() {
      return shTitle;
   }


   public void setShTitle(String shTitle) {
      this.shTitle = shTitle;
   }


   public String getShType() {
      return shType;
   }


   public void setShType(String shType) {
      this.shType = shType;
   }


   public String getShAddress() {
      return shAddress;
   }


   public void setShAddress(String shAddress) {
      this.shAddress = shAddress;
   }


   public String getShLa() {
      return shLa;
   }


   public void setShLa(String shLa) {
      this.shLa = shLa;
   }


   public String getShLo() {
      return shLo;
   }


   public void setShLo(String shLo) {
      this.shLo = shLo;
   }


   public String getShSubway() {
      return shSubway;
   }


   public void setShSubway(String shSubway) {
      this.shSubway = shSubway;
   }

   public String getStatus() {
      return status;
   }
   
   public void setStatus(String status){
      this.status = status;
   }

   public String getShRno() {
      return shRno;
   }


   public void setShRno(String shRno) {
      this.shRno = shRno;
   }


   public String getShGender() {
      return shGender;
   }


   public void setShGender(String shGender) {
      this.shGender = shGender;
   }


   public int getShCapacity() {
      return shCapacity;
   }


   public void setShCapacity(int shCapacity) {
      this.shCapacity = shCapacity;
   }


   public String getShI() {
      return shI;
   }


   public void setShI(String shI) {
      this.shI = shI;
   }


   public String getShItype() {
      return shItype;
   }


   public void setShItype(String shItype) {
      this.shItype = shItype;
   }


   public String getShIpath() {
      return shIpath;
   }


   public void setShIpath(String shIpath) {
      this.shIpath = shIpath;
   }


   public String getShChName() {
      return shChName;
   }


   public void setShChName(String shChName) {
      this.shChName = shChName;
   }


   @Override
   public String toString() {
      return "Search [shNo=" + shNo + ", shTitle=" + shTitle + ", shType=" + shType + ", shAddress=" + shAddress
            + ", shLa=" + shLa + ", shLo=" + shLo + ", shSubway=" + shSubway + ", status=" + status + ", shRno=" + shRno + ", shGender="
            + shGender + ", shCapacity=" + shCapacity + ", shI=" + shI + ", shItype=" + shItype + ", shIpath="
            + shIpath + ", shChName=" + shChName + "]";
   }

   
   
   
   
   
   
   
   
   
}