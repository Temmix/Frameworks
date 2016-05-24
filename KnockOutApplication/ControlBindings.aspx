<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ControlBindings.aspx.cs" Inherits="KnockOutApplication.ControlBindings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2> CONTROLS BINDING USING KNOCKOUT JS</h2>
     <div id="foreach-bindings">
        <h3>FOREACH BINDINGS</h3>
        <div>
           <ul data-bind="foreach: products">
               <li>
                   Product at position : <span data-bind="text: $index" >  </span>
                   <span data-bind="text: name"> </span>
                   <a href="#" data-bind="click: $parent.removeProduct" >Remove this</a>
               </li>
           </ul> 
           <button id ="buttonAddProduct" data-bind="click: addProduct" >Add New Product</button>
        </div>
        <br />
        <hr />
    </div>
    
     <div id="if-bindings">
        <h3>IF BINDINGS</h3>
        <span>This will not show price for drinks with null value</span>
        <div>
           <ul data-bind="foreach: products">
               <li>
                   Product at position : <span data-bind="text: $index" >  </span>
                   <span data-bind="text: name"> </span>
                   <span data-bind="if:cost">, its Price is : £<span data-bind="text: cost.listPrice"></span></span>
               </li>
           </ul> 
        </div>
        <br />
        <hr />
    </div>
    
     <div id="ifnot-bindings">
        <h3>IFNOT BINDINGS</h3>
        <span>This will show price for drinks higher than £50.00</span>
        <div>
           <ul data-bind="foreach: products">
               <li>
                   Product at position : <span data-bind="text: $index" >  </span>
                   <span data-bind="text: name"> </span>
                   <span data-bind="ifnot:cost.listPrice < 50" >, its Price is : £<span data-bind="text: cost.listPrice"></span></span>
               </li>
           </ul> 
        </div>
        <br />
        <hr />
    </div>
    
    
     <div id="with-bindings">
        <h3>WITH BINDINGS</h3>
     <span>This will display City record that has Restaurant's name</span>
       <ul data-bind="foreach: Cities" >
          <%--THIS IS THE WHERE CLAUSE--%>
           <div data-bind="with: Restaurant.name"> 
             <li>
                  <span data-bind="text: $index"></span> &nbsp;
                  In the City of <b><span data-bind="text: $parent.cityName"></span></b>&nbsp;
                  there is a Restaurant called : <b><span data-bind="text: $parent.Restaurant.name"></span></b>,&nbsp;
                  and the meal type is : <b><span data-bind="text: $parent.Restaurant.Type"></span></b>.
            </li> 
            </div> 
       </ul> 
      
        <br />
        <hr />
    </div>
    
    <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="Scripts/knockout-3.0.0.js" type="text/javascript"></script>
    <script type="text/javascript">
       
        $('#buttonAddProduct').bind('click', function (e) {
            e.preventDefault();
        });

        var ForeachViewModel = function () {
            var self = this;
            self.products = ko.observableArray([
                    { name: 'Coke' },
                    { name: 'Pepsi' },
                    { name: 'Maltina'}
                ]);

            self.addProduct = function () {
                self.products.push({ name: 'New-Products' });
            };

            self.removeProduct = function () {
                self.products.remove(this);
            };
        };
        ko.applyBindings(new ForeachViewModel(), $('#foreach-bindings')[0]);

        var IfViewModel = function () {
            var self = this;
            self.products = ko.observableArray([
                    { name: 'Coke' , cost: { listPrice: 100.00 } },
                    { name: 'Pepsi', cost: null },
                      { name: 'Red Juice', cost: { listPrice: 50.00} },
                    { name: 'Red Juice', cost: { listPrice: 65.00} },
                    { name: '7-up', cost: { listPrice: 75.00} },
                    { name: 'Maltina', cost: { listPrice: 150.00} }
                ]);
        };
        ko.applyBindings(new IfViewModel(), $('#if-bindings')[0]);

        var IfNotViewModel = function () {
            var self = this;
            self.products = ko.observableArray([
                    { name: 'Coke', cost: { listPrice: 100.00} },
                    { name: 'Pepsi', cost: { listPrice: 45.00} },
                    { name: 'Red Juice', cost: { listPrice: 49.00} },
                    { name: 'Red Juice', cost: { listPrice: 65.00} },
                    { name: '7-up', cost: { listPrice: 75.00} },
                    { name: 'Maltina', cost: { listPrice: 150.00} }
                ]);
        };
        ko.applyBindings(new IfNotViewModel(), $('#ifnot-bindings')[0]);

        var WithViewModel = function () {
            var self = this;
            self.Cities = ko.observableArray([
                { cityName:'San Francia' , Restaurant: { name: 'El Clasio', Type: 'Mexican Food'}},
                { cityName:'Saint Lucia' , Restaurant:{ name: 'La Carabrian', Type: 'Carribean Food'}},
                { cityName:'Lagos city' , Restaurant:{ name: 'Ayo Ni o', Type: 'Nigerian Food' }},
                { cityName: 'London', Restaurant:{name:'', Type:''}}
                ]);
        };
        ko.applyBindings(new WithViewModel(), $('#with-bindings')[0]);
        
    </script>
</asp:Content>
