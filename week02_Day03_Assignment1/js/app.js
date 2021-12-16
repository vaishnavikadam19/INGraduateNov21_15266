function Book(bookId,bookName,authorName)
{
    this.bookId=bookId;
    this.bookName=bookName;
    this.authorName=authorName;
    this.displayDetails=function(){
        return "Book Id: "+this.bookId+"<br/>"+"Book Name: "+this.bookName+"<br/>"+"Author name: "+this.authorName;

    }
}
const book1=new Book(1,"History of Ancient India","Rama Shankar Tripathi");
const div1=document.getElementById("div1");
div1.innerHTML=book1.displayDetails();