<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="First-FormBinding.aspx.cs" Inherits="KnockOutApplication.First_FormBinding" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <h2> FORM BINDING USING KNOCKOUT JS</h2>
     
     <div id="click-bindings">
        <h3>CLICK BINDINGS</h3>
        <div>
          <ul data-bind="foreach: states">
            <li>
               <span data-bind="text: $data"></span> 
               <button id="buttonRemoveState" data-bind="click: $parent.removeState">Remove state</button>
            </li>
          </ul>
        </div>
        <br />
        <hr />
    </div>
    
     <div id="event-bindings">
        <h3>EVENTS BINDINGS</h3>
         <br />
        <div>
         <input type="text" data-bind="event: { keypress: checkData }" />
         <div data-bind="visible: returnData">YOU HAVE PRESSED A KEY RIGHT :) !!!</div>
        </div>
        <br />
        <hr />
    </div>
    
    <div id="submit-bindings">
        <h3>SUBMIT BINDINGS</h3>
         <br />
        <div data-bind="visible: returnResponse">
             My submit form does not work, probably in another environment <br/>
            it will I just replace the submit event with click event , c below data-bind<br/>
        </div>
            <form method="POST" action="#">
                    <input type="text"/> <br/> <br />
                <button id="submitFormButton" type="submit" data-bind="click: runMe">Submit Info</button>
            </form>
        <br />
        <hr />
    </div>
    
    
    <div id="enable-bindings">
        <h3>ENABLE BINDINGS</h3>
         <br />
        <div>
            <input type="checkbox" data-bind="checked: hasChannels"/>
         <input type="text" data-bind="value : channels , enable: hasChannels " />
       
        </div>
        <br />
        <hr />
    </div>

     <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="Scripts/knockout-3.0.0.js" type="text/javascript"></script>
    <script type="text/javascript">
        
        $('#buttonRemoveState').bind('click', function (e) {
            e.preventDefault();
        });
        
        var ClickViewModel = function () {
            var self = this;
            self.states = ko.observableArray(['Lagos', 'Abuja', 'Ibadan', 'Coventry', 'London']);

            self.removeState = function(_state) {
                self.states.remove(_state);
            };
        };
        ko.applyBindings(new ClickViewModel(),$('#click-bindings')[0]);

        var EventViewModel = function () {
            var self = this;
            self.returnData = ko.observable(false);
            
            self.checkData = function () {
                self.returnData(true);
            };
        };
        ko.applyBindings(new EventViewModel(), $('#event-bindings')[0]);

        $('#submitFormButton').bind('click', function (e) {
            e.preventDefault();
        });

        var SubmitViewModel = function () {
            var self = this;
            self.returnResponse = ko.observable(false);
            console.log('firstime ' + self.returnResponse());
            self.runMe = function () {
                self.returnResponse(true);
                console.log('secondtime ' + self.returnResponse());
            };
        };
        ko.applyBindings(new SubmitViewModel(), $('#submit-bindings')[0]);

        var EnableViewModel = function () {
            var self = this;
            self.channels = ko.observableArray(['CNN', 'ESPN', 'BBC', 'AIT', 'NTA']);

            self.hasChannels = ko.observable(false);
        };
        ko.applyBindings(new EnableViewModel(), $('#enable-bindings')[0]);
    </script>
</asp:Content>
