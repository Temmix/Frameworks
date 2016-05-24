<%@ Page Title="Appearance-Bindings" Language="C#" MasterPageFile="~/Site.master"
    AutoEventWireup="true" CodeBehind="Appearance-bindings.aspx.cs" Inherits="KnockOutApplication.AppearanceBindings" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        APPEARANCE BINDING USING KNOCKOUT JS
    </h2>
    <div id="visible-bindings">
        <h3>
            VISIBLE BINDINGS</h3>
        <div data-bind="visible: showMe" style="color: green;">
            <br />
            KNOCKOUT JS ROCKS !!!
        </div>
        <br />
        <button data-bind="click: changeMe">
            Toggle Visibility</button>
            <br />
    <hr />
    </div>
    
    <div id="text-bindings">
        <h3>
            TEXT BINDINGS</h3>
        <div>
            <br />
            How much do they sell Royce Rolce ?
            <input type="text" data-bind="value: costPrice, valueUpdate: 'afterkeydown'" />
            <br />
            <div style="color: green;" data-bind="text: isCostly">
            </div>
            <br />
        </div>
        <br />
        <hr />
    </div>

    <div id="html-bindings">
        <h3>
            HTML BINDINGS</h3>
        <div>
            <br />
            <div data-bind="html: showHtml" >
            </div>
            <br/>
            <button data-bind="click: toggleShowHtml" id="buttonToggle" >Toggle Html View</button>
        </div>
        <br />
        <hr />
    </div>
    
    <div id="css-bindings">
        <h3>
            CSS BINDINGS</h3>
        <div>
            <br />
            <div data-bind="css:{'show-Error': showError()==true , 'show-No-Error': showError()==false}" >
                CSS-BINDING TOGGLE ERROR MESSAGE COLOR
            </div>
            <br/>
            <button data-bind="click: toggleShowError" id="buttonCssToggle" >Toggle Css View</button>
        </div>
        <br />
        <hr />
    </div>
    
    <div id="style-bindings">
        <h3>
            STYLE BINDINGS</h3>
        <div>
            <br />
            <div data-bind="style:{ color : myNumber() < 5 ? 'red' : 'green' }" >
                STYLE-BINDING UTILIZING INLINE STYLING
            </div>
            <br/>
            <button data-bind="click: toggleShowStyle" id="buttonStyleToggle" >Toggle Style View</button>
        </div>
        <br />
        <hr />
    </div>
    
        <div id="attr-bindings">
        <h3>
            ATTR BINDINGS</h3>
        <div>
            <table>
                <tr>
         <td>Set the Url here :</td>  <td> <input data-bind="value: theUrl" /></td>
         </tr>
            <tr> 
          <td>Set the Title here</td>  <td><input data-bind="value: theTitle" /></td>
          </tr>
          </table>
            <br />
            <a data-bind="attr:{href: theFullAddress, title: theTitle}">
            DYNAMIC-LINK
            </a>
            <br/>
        </div>
        <br />
        <hr />
    </div>
    
    <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="Scripts/knockout-3.0.0.js" type="text/javascript"></script>
    <script type="text/javascript">
      
        var VisibleViewModel = function () {
            this.showMe = ko.observable(true);

            this.changeMe = function () {
                var currentResult = this.showMe();
                if (currentResult) {
                    this.showMe(false);
                }
                else {
                    this.showMe(true);
                }
            } .bind(this);
        };
        ko.applyBindings(new VisibleViewModel(), $('#visible-bindings')[0]);


        var TextViewModel = function () {
            this.costPrice = ko.observable('');

            this.isCostly = ko.computed(function () {
                var currentPrice = this.costPrice();
                var result;
                if (currentPrice != '') {
                    result = currentPrice > 350000 ? 'THIS IS TOO COSTLY' : 'IT IS AFFORDABLE';
                }
                return result;
            }, this);
        };
        ko.applyBindings(new TextViewModel(), $('#text-bindings')[0]);
      
        
        $('#buttonToggle').bind('click', function (e) {
            e.preventDefault();
        });

        var HtmlViewModel = function () {
            this.showHtml = ko.observable('<b>I SHOULD BE BOLD</b> <ul><li>ONE</li><li>TWO</li><li>THREE</li></ul>');
            this.shouldShowHtml = ko.observable(false);
            
            this.toggleShowHtml = function () {
                var html = this.shouldShowHtml();
                var result;
                if (html) {
                    this.showHtml('<b>I SHOULD BE BOLD</b> <ul><li>ONE</li><li>TWO</li><li>THREE</li></ul>');
                    this.shouldShowHtml(false);
                }
                else {
                    this.showHtml('');
                    this.shouldShowHtml(true);
                }
                return result;
            }.bind(this);
        };
        ko.applyBindings(new HtmlViewModel(), $('#html-bindings')[0]);
        

        $('#buttonCssToggle').bind('click', function (e) {
            e.preventDefault();
        });

        var CssViewModel = function () {
            this.showError = ko.observable(true);
            this.shouldshowError = ko.observable(false);
            console.log(this.showError());
           
            this.toggleShowError = function () {
                var html = this.showError();
                if (html) {
                    this.showError(false);
                }
                else {
                    this.showError(true);
                }
            } .bind(this);
        };
        ko.applyBindings(new CssViewModel(), $('#css-bindings')[0]);


        $('#buttonStyleToggle').bind('click', function (e) {
            e.preventDefault();
        });
        
        var StyleViewModel = function () {
            this.myNumber = ko.observable(20);

            this.toggleShowStyle = function () {
                var html = this.myNumber();
                if (html > 5) {
                    this.myNumber(0);
                }
                else {
                    this.myNumber(20);
                }
            }.bind(this);
        };
        ko.applyBindings(new StyleViewModel(), $('#style-bindings')[0]);

        var AttrViewModel = function () {
            
            this.theUrl = ko.observable('google.com');
            this.theTitle = ko.observable('This can be Changed');
            this.theFullAddress = ko.computed(function() {
                var http = 'http://www.';
                var theUrl = this.theUrl();
                return (http + theUrl);
            },this);
            

        };
        ko.applyBindings(new AttrViewModel(), $('#attr-bindings')[0]); 
    </script>
</asp:Content>
