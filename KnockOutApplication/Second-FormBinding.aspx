<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Second-FormBinding.aspx.cs" Inherits="KnockOutApplication.Second_FormBinding" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
       <h2> SECOND FORM BINDING USING KNOCKOUT JS</h2>

    <div id="checked-bindings">
        <h3>CHECKED BINDINGS</h3>
         <br />
        <div>
      <p>
         You are Alive ? <input type="checkbox" data-bind="checked: isAlive" />
      </p>
            <p data-bind="visible: isAlive">This should be visible whenever you are alive</p>
        </div>
        <br />
        <hr />
    </div>

     <div id="options-bindings">
        <h3>OPTIONS BINDINGS</h3>
         <br />
        <div>
            <table>
            <tr>
        <td> Select your drink</td> <td><select  data-bind="options: availableDrinks, optionsCaption: 'Choose ....'"  ></select></td>
      </tr>

      <tr>
        <td> Select your drinks</td> <td><select  data-bind="options: availableDrinks, optionsCaption: 'Choose ....'" multiple="multiple" ></select></td>
      </tr>

            </table>
        </div>
        <br />
        <hr />
    </div>

    <div id="options-two-bindings">
        <h3>OPTIONS BINDINGS TWO</h3>
         <br />
        <div>
        <span> Select your drink</span> 
        <span><select  data-bind="options: availableDrinks, optionsText: 'productName', value: selectedProduct, optionsCaption: 'Choose ....'"  ></select></span>
     <div data-bind="visible:selectedProduct()">
         You have choosen a drink that cost : 
        <b data-bind="text: selectedProduct() ? selectedProduct().productPrice : 'unknown' " ></b> dollars.
     </div>  
        </div>
        <br />
        <hr />
    </div>

    <div id="selectedoptions-bindings">
        <h3>SELECTED OPTIONS BINDINGS TWO</h3>
         <br />
        <div>
        <span> Select your drink</span> 
        <span><select  data-bind="options: availableDrinks, selectedOptions: selectedDrinks, optionsCaption: 'Choose ....'" multiple="multiple"  ></select></span>
       
        </div>
        <br />
        <hr />
    </div>

    <div id="uniquename-bindings">
        <h3>UNIQUE NAME BINDINGS </h3>
         <br />
        <div>
        <input id="uniqueNameId" data-bind="value: myValue, uniqueName: true"/> 
        The unique name is <b id ="uniqueNameResult"></b>
        </div>
        <br />
        <hr />
    </div>

     <div id="template-bindings">
        <h3>TEMPLATING BINDINGS </h3>
         <br />
        <div data-bind="template: {name: 'product-template', foreach: products}">
        
        </div>
        <br />
        <hr />
    </div>

     <script type="text/html" id="product-template" >
     <h4 data-bind="text: name"></h4>
     <p>Cost: <span data-bind="text: cost"></span></p>
    </script>


    <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="Scripts/knockout-3.0.0.js" type="text/javascript"></script>
    <script type="text/javascript">
        
        var CheckedViewModel = function () {
            var self = this;
            self.isAlive = ko.observable(false);
        };
        ko.applyBindings(new CheckedViewModel(), $('#checked-bindings')[0]);

        var OptionsViewModel = function () {
            var self = this;
            self.availableDrinks = ko.observableArray(['Maltina','Pepsi','7-Up', 'Bart\'s']);
        };
        ko.applyBindings(new OptionsViewModel(), $('#options-bindings')[0]);
        
        var Product = function(name, price){
            this.productName = name;
            this.productPrice = price;
        };

        var OptionsViewModelTwo = function () {
            var self = this;
            self.availableDrinks = ko.observableArray([
               new Product('Maltina',10.00),
               new Product('Pepsi',20.00),
               new Product('7-Up', 30.00),
               new Product('Bart\'s', 40.00)
            ]);
            self.selectedProduct = ko.observable();
        };
        ko.applyBindings(new OptionsViewModelTwo(), $('#options-two-bindings')[0]);


        var SelectedOptionsViewModel = function () {
            var self = this;
            self.availableDrinks = ko.observableArray(['Maltina', 'Pepsi', '7-Up', 'Bart\'s']);
            self.selectedDrinks = ko.observableArray(['Pepsi']);
        };
        ko.applyBindings(new SelectedOptionsViewModel(), $('#selectedoptions-bindings')[0]);

        $(function () {
            var id = $('#uniqueNameId').attr('name');
            $('#uniqueNameResult').text(id);
        });
        var UniqueNameViewModel = function () {
            var self = this;
            self.myValue = ko.observableArray();
        };
        ko.applyBindings(new UniqueNameViewModel(), $('#uniquename-bindings')[0]);

        
        var TemplateViewModel = function () {
            var self = this;
            self.products = ko.observableArray([
                   {name: 'Maltina', cost: '6.00'},
                   {name: 'Pepsi', cost:'10.00'}, 
                   {name: '7-Up', cost: '7.00'}, 
                   { name: 'Bart\'s', cost: '15.00' }
            ]);
        };
        ko.applyBindings(new TemplateViewModel(), $('#template-bindings')[0]);

    </script>

   

</asp:Content>
