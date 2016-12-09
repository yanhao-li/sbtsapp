/*
The purpose of this is to enable the functionalities of the shared bean for maxapp. It is an important file
that holds the set, and get methods for the bean. Without it, the functionalities of the maxapp
website would not be available.

*/

//local
package maxapp;

import java.util.*;
import java.io.Serializable;


public class Shared implements Serializable {
// session bean named "shared" Tomcat keeps alive between login sessions

	private String error = "";            // string to hold error message
	private String message = "";          // string to hold the message

	private int empid;            // employee's unique id number
	private String EmpLastName;      // employee's last name
    private String EmpFirstName;     // employee's first name
    private String email;      // employee's email
    private String title;            // employee's title
    private String department;          // employee's department name
    private String Manager;          // is employee a manager or not
    private String commissionrate;   // commission rate if a salesman
    private String shepherd;         // if the employee is shepherd capable (Y/N)
    private String skill;         // employee's skill
    private String [][] newContracts; //a matrix of a new contract
    private String [][] selectedContract; //a matrix that holds the selected Contract that is displayed/edited
    private String [][] selectedBook; //A matrix of the selected book and its details
    private String [][] selectedTask; //a matrix of the selected task
    private String [][] shepherds;  //Employees of maxapp from line 28 - 31
    private String [][] designers;
    private String [][] editors;
    private String [][] admins;
    private String [][] books; //Books that are currently in maxapp
    private String [][] confirmbook; //Lines 40 - 42 are matrix variables used for confirmation
    private String [][] confirmshepherd;
    private String [][] confirmtask;
    private String [][] shepherdcount; //Displays the number of shepherds.
    private String [][] shepherdbooklist; //The list of books a shepherd is in charge of
    private String [][] techtasklist; //List of tasks that a tech is responsible for
    private String [] taskdetail; //Details of a single task
	private String [][] tasksofbook;
    private String ChooseTaskStatus; //Choose the status of a task
    private String ContractID; //Lines 48 - 53 are variables for IDs
    private String ShepherdID;
    private String TechID;
    private String TaskID;
    private String BookID;
    private String AuthorID;
    private String authorlastname; //Lines 54 - 55 are variables for an author's last name, and first name
    private String authorfirstname;



        /****************/
        /* Constructors */
        /****************/

        /* Beans must have a zero argument constructor */
        public void Shared() {
        }

        /** Public Accessor Methods, required get/sets
         * for jsp:getProperty, jsp:setProperty
        */

        public int getEmpId() {
                return(this.empid);
        }
        public void setEmpId(int value) {
                this.empid = value;
        }

        public String getEmpFirstName() {
                return(this.EmpFirstName);
        }
        public void setEmpFirstName(String value) {
                this.EmpFirstName = value;
        }

        public String EmpLastName() {
                return(this.EmpLastName);
        }
        public void setEmpLastName(String value) {
                this.EmpLastName = value;
        }
   		public String getemailAddress() {
               return(this.email);
        }
        public void setemailAddress(String value) {
              this.email= value;
        }
		public String getTitle() {
               return(this.title);
        }
        public void setTitle(String value) {
              this.title= value;
        }

        public String getDepartment() {
                return(this.department);
        }
        public void setDepartment(String value) {
                this.department = value;
        }
        public String getManager() {
               return(this.Manager);
        }
        public void setManager(String value) {
              this.Manager = value;
        }

        public String getCommissionRate() {
               return(this.commissionrate);
        }
        public void setCommissionRate(String value) {
              this.commissionrate= value;
        }

        public String getShepherd() {
          	return(this.shepherd);
        }
        public void setShepherd(String value) {
          	this.shepherd = value;
        }

        public String getSkill() {
                return(this.skill);
        }
        public void setSkill(String value) {
		this.skill = value;
        }

                public String getChooseTaskStatus() {
          	return(this.ChooseTaskStatus);
        }
        public void setChooseTaskStatus(String value) {
          	this.ChooseTaskStatus = value;
        }

		//getError displays the error aquired from setError... (see lines 150 - 152, they relate)

        public String getError() {
        	return(this.error);
   }
        public void setError(String value) { // set error saves the error value from an exception
                this.error = value;
   }

	public String getMessage() {
        	return(this.message);
   }
        public void setMessage(String value) { // set any message the user needs to see from a servlet
        	this.message = value;
   }

       public String [][] getNewContracts()
   {
      return(this.newContracts);
   }
   public void setNewContracts(String [][] value)
   {
      this.newContracts = value;
   }

          public String [][] getSelectedContract()
   {
      return(this.selectedContract);
   }
   public void setSelectedContract(String [][] value)
   {
      this.selectedContract = value;
   }

         public String [][] getSelectedBook()
   {
      return(this.selectedBook);
   }
   public void setSelectedBook(String [][] value)
   {
      this.selectedBook = value;
   }

         public String [][] getSelectedTask()
   {
      return(this.selectedTask);
   }
   public void setSelectedTask(String [][] value)
   {
      this.selectedTask = value;
   }


         public String [][] getShepherds()
   {
      return(this.shepherds);
   }
   public void setShepherds(String [][] value)
   {
      this.shepherds = value;
   }

             public String [][] getDesigners()
   {
      return(this.designers);
   }
   public void setDesigners(String [][] value)
   {
      this.designers = value;
   }

    public String [][] getEditors()
   {
      return(this.editors);
   }
   public void setEditors(String [][] value)
   {
      this.editors = value;
   }


                public String [][] getAdmins()
   {
      return(this.admins);
   }
   public void setAdmins(String [][] value)
   {
      this.admins = value;
   }


        public String [][] getBooks()
   {
      return(this.books);
   }
   public void setBooks(String [][] value)
   {
      this.books = value;
   }

           public String [][] getConfirmBook()
   {
      return(this.confirmbook);
   }
   public void setConfirmBook(String [][] value)
   {
      this.confirmbook = value;
   }

              public String [][] getConfirmShepherd()
   {
      return(this.confirmshepherd);
   }

   public void setConfirmShepherd(String [][] value)
   {
      this.confirmshepherd = value;
   }

    public String [][] getConfirmTask()
   {
      return(this.confirmtask);
   }
   public void setConfirmTask(String [][] value)
   {
      this.confirmtask = value;
   }


         public String [][] getShepherdCount()
   {
      return(this.shepherdcount);
   }
   public void setShepherdCount(String [][] value)
   {
      this.shepherdcount = value;
   }


	public String [][] getShepherdBookList()
   {
      return(this.shepherdbooklist);
   }
   public void setShepherdBookList(String [][] value)
   {
      this.shepherdbooklist = value;
   }

	public String [][] getTechTaskList()
   {
      return(this.techtasklist);
   }

   public void setTechTaskList(String [][] value)
   {
      this.techtasklist = value;
   }

    public String [][] getTasksofBook()
   {
      return(this.tasksofbook);
   }
   public void setTasksofBook(String [][] value)
   {
      this.tasksofbook = value;
   }

	public String[] getTaskDetail()
	{
		return(this.taskdetail);
	}

	public void setTaskDetail(String [] value)
	{
		this.taskdetail = value;
	}



        public String getContractID() {
                return(this.ContractID);
        }
        public void setContractID(String value) {
		this.ContractID = value;
        }

         public String getBookID() {
                return(this.BookID);
        }
        public void setBookID(String value) {
		this.BookID = value;
        }

         public String getTechID() {
                return(this.TechID);
        }
        public void setTechID(String value) {
		this.TechID = value;
        }

          public String getTaskID() {
                return(this.TaskID);
        }
        public void setTaskID(String value) {
		this.TaskID = value;
        }

                 public String getShepherdID() {
                return(this.ShepherdID);
        }
        public void setShepherdID(String value) {
		this.ShepherdID = value;
        }

         public String getAuthorID() {
                return(this.AuthorID);
        }
        public void setAuthorID(String value) {
		this.AuthorID = value;
        }

	        public String getAuthorfirstname() {
                return(this.authorfirstname);
        }
        public void setAuthorfirstname(String value) {
                this.authorfirstname = value;
        }

        public String getAuthorlastname() {
                return(this.authorlastname);
        }
        public void setAuthorlastname(String value) {
                this.authorlastname = value;
        }


} // end of shared bean
