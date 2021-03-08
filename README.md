# Lists_Ada_Package
This package is a university project that aims to create an open-source package to use linked lists in a python style but with the benefits of Ada language. 
<br/>
<br/>
I am not an expert in Ada, so any suggestions would be appreciated.  
I know there are incredibly inefficient parts of the code, I mainly wanted it to work again all changes are appreciated.  
<br/>
<br/>
<br/>
# How to use:
First, we need to create an instance of the package and we need to pass the object type, an image function for that object, an equality function and finally a delete function.

```
package Integer_List is new lists(type,Image,equality,delete);
```

I was unable to create subgeneric methods for the object so you are obligated to pass all the arguments.  
For the delete procedure, if it's a primary type, you should pass a null function, the objective of the delete is only to free all the memory if the lists contain a chained access object. That's why lists also have an empty method, to instantiate it into another list as an element.
<br/>
<br/>
To create a list you define an array with the initial values of type __Tab_Of_List_Type__:
```
arr : Tab_Of_List_Type (1..5) := (1,2,3,4,5);
```
And then we call the Create_List(arr); a function that returns a list object with the values on the array.  
  *To create an empty list we just need to create an empty array ```arr : Tab_Of_List_Type (1..0)```
```
L1: List := Create_List(arr);
```
<br/>
<br/>
The available methods are:  

```  
  --Exceptions:  
   Element_not_in_the_list : exception;  
   Get_Index_Value_Outside_the_list : exception;  
   Get_Index_value_negative_not_implemented_yet: exception;  
   type List is tagged private;  
   type Tab_Of_List_Type is array (Integer range <>) of T_Data;  
   
   --takes an array and returns the same elements in a list  
   function Create_List(Elements: Tab_Of_List_Type) return List;  
   
   --appends an element at the end of the list  
   procedure Append(Self:in out List; Data: T_Data);  
   
   --returns the lenght of the list  
   function Length(Self:in List) return Natural;  
   
   --returns the N element of the list  
   function get(Self:in List; Index: Integer) return T_Data;  
   
   --returns the index where the element is  
   function Index(Self: in List; Element : T_Data) return Integer;  
   
   --returns the image of the list in JSON format  
   function Image(Self: in out List) return String;  
   
   --replaces the value of the index  
   procedure Set(Self:in out List; Index : Integer; New_Value: T_Data);    
   
  --removes only the first instance of the element in the list  
   procedure Remove_Element(Self: in out List; Element: T_Data);  
   
   --removes the index on the list  
   procedure Remove_Index(Self: in out List; Index: Integer);  
   
   --deletes all the elements in the list and frees the memory  
   procedure Empty(Self: in out List );  
   
   --concatenates the lists  
   function "+" (L,R: List) return List;  

   --tests if all the items are the same  
   function "=" (L,R: List) return Boolean;  
 ```
 <br/>
 <br/>
 <br/>
 <br/>
 
 # Examples:  
 Create and use and integer list:
 ```
with Lists;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
--we create the delete integer function which does nothing, only to instantiate
   procedure del_int(obj: Integer) is
   begin
      null;
   end del_int;

--we instanciate the package creating an integer list
   package Integer_List is new lists(Integer,Integer'Image,"=",del_int);
   use Integer_List; --remove if multiple list types are used.


   arr : Tab_Of_List_Type (1..5) := (1,2,3,4,5);
   L1: List := Create_List(arr);
   
   arr2 : Tab_Of_List_Type (1..0);
   Ln: List := Create_List(arr2); --null list

n : Integer;
begin


--print the list
Put_Line("Image: " & L1.Image);


--take an index
n := L1.Index(2);

.
.
.
.
.


end Main;
```
