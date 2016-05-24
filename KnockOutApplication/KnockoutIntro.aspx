<%@ Page Title="KnockOut Introduction" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="KnockoutIntro.aspx.cs" Inherits="KnockOutApplication.KnockoutIntro" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        INTRODUCTION TO KNOCKOUT JS USING ASP.NET !
    </h2>
    <div id="observable">
        <h3>Knockout JS Observable Function</h3><br/>
        <div>
         The product name is  <span data-bind="text: productName"></span> with the category of  
         <span data-bind="text: productCat"></span>
        </div>
        <br/>
         <div>
             <table>
                 <tr>
                       <td>The Product name is</td>
                       <td><input type="text" data-bind="value:productName"/> </td>
                 </tr>
                 <tr> 
                       <td>The Product category is  </td>
                       <td> <input type="text" data-bind="value:productCat"/> </td>
                 </tr>
             </table>
        </div>
 </div>
 <br/><hr/><br/>
 <div id="computed-observable">
        <h3>Knockout JS Computed Observable Function</h3>
        <br/>
         <table>
                 <tr>
                       <td>What is your first name </td>
                       <td><input type="text" data-bind="value: firstName" /> </td>
                 </tr>
                 <tr> 
                       <td>What is your last name  </td>
                       <td> <input type="text" data-bind="value: lastName" /> </td>
                 </tr>
             </table>
        <br/>
       Your full Name is <span data-bind="text: fullName"></span>

 </div>
  <br/><hr/><br/>
  
  <div id="computed-observableArray">
        <h3>Knockout JS Computed Observable Arrays Function</h3>
        <br/>
      
       Item to Add <input type="text" data-bind="value: newItem, valueUpdate: 'afterkeydown'" />
          <button type="submit" data-bind="enable: newItem().length > 0, click: addNewItem" >Add Item</button>
       <p>Your current List are these</p>
       <select multiple="multiple" width="100" data-bind="options: items" ></select>
    

 </div>
  <br/><hr/><br/>

    <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="Scripts/knockout-3.0.0.js" type="text/javascript"></script>
    <script type="text/javascript">
        
        var viewModel = {
            productName: ko.observable('iPhone 6'),
            productCat: ko.observable('Smart Gadgets')
        };
        
        ko.applyBindings(viewModel, $('#observable')[0]);

        var PersonViewModel = function () {
            this.firstName = ko.observable('First Name');
            this.lastName = ko.observable('Last Name');

            this.fullName = ko.computed(function () {
                var result;
                if (this.firstName() != 'First Name' && this.lastName() != 'Last Name') {
                    result = this.firstName() + " " + this.lastName();
                }
                return result;
            }, this);
        };
        ko.applyBindings(new PersonViewModel(), $('#computed-observable')[0]);
       
       $('#submitIdBaba').click(function (e) {
            e.preventDefault();
        });
        
        var ArrayViewModel = function (items) {
            this.items = ko.observableArray(items);
            this.newItem = ko.observable('');

            this.addNewItem = function () {
                if (this.newItem() != '') {
                    this.items.push(this.newItem());
                    this.newItem('');
                }
            }.bind(this);
        };
        ko.applyBindings(new ArrayViewModel(['first', 'second', 'third']), $('#computed-observableArray')[0]);
        
    </script>
    
</asp:Content>
