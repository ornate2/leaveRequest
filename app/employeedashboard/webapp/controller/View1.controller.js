sap.ui.define([
    "sap/ui/Device",
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel",
    "sap/m/Dialog",
    "sap/m/Popover",
    "sap/m/Button",
    "sap/m/library",
    "sap/m/Text",
   
  
    "sap/ui/core/IconPool"
], function (Device, Controller, JSONModel, Dialog, Popover, Button, library , Text,  IconPool) {
    "use strict";

    var ButtonType = library.ButtonType,
        PlacementType = library.PlacementType;

   
        return Controller.extend("employeedashboard.controller.View1", {
        onInit: function () {
            var oModel = new JSONModel(sap.ui.require.toUrl("employeedashboard/model/data.json"));
            this.getView().setModel(oModel);
            this._setToggleButtonTooltip(!Device.system.desktop);
        },

        onItemSelect: function (oEvent) {
            var oItem = oEvent.getParameter("item");
            this.byId("pageContainer").to(this.getView().createId(oItem.getKey()));
        },

        handleUserNamePress: function (event) {
            var oPopover = new Popover({
                showHeader: false,
                placement: PlacementType.Bottom,
                content: [
                    new Button({
                        text: 'Feedback',
                        type: ButtonType.Transparent
                    }),
                    new Button({
                        text: 'Help',
                        type: ButtonType.Transparent
                    }),
                    new Button({
                        text: 'Logout',
                        type: ButtonType.Transparent
                    })
                ]
            }).addStyleClass('sapMOTAPopover sapTntToolHeaderPopover');

            oPopover.openBy(event.getSource());
        },

        onSideNavButtonPress: function () {
            var oToolPage = this.byId("toolPage");
            var bSideExpanded = oToolPage.getSideExpanded();

            this._setToggleButtonTooltip(bSideExpanded);

            oToolPage.setSideExpanded(!oToolPage.getSideExpanded());
        },

        _setToggleButtonTooltip: function (bLarge) {
            var oToggleButton = this.byId('sideNavigationToggleButton');
            if (bLarge) {
                oToggleButton.setTooltip('Large Size Navigation');
            } else {
                oToggleButton.setTooltip('Small Size Navigation');
            }
        },
     
        onEscapePreventDialogPress: function () {
                    if (!this.oEscapePreventDialog) {
                        this.oEscapePreventDialog = new Dialog({
                            title: "Apply Leave",
                            content: new Text({ 
                                text: "Try to close this Dialog with the Escape key",
                                styleClass: "sapUiSmallMargin" // Setting the style class directly
                            }),
                            
                            buttons: [
                                new Button({
                                    text: "Simply close",
                                    press: function () {
                                        this.oEscapePreventDialog.close();
                                    }.bind(this)
                                })
                            ],
                            escapeHandler: function (oPromise) {
                                if (!this.oConfirmEscapePreventDialog) {
                                    this.oConfirmEscapePreventDialog = new Dialog({
                                        title: "Are you sure?",
                                        content: new Text({ text: "Your unsaved changes will be lost" }),
                                        type: DialogType.Message,
                                        icon: IconPool.getIconURI("message-information"),
                                        buttons: [
                                            new Button({
                                                text: "Yes",
                                                press: function () {
                                                    this.oConfirmEscapePreventDialog.close();
                                                    oPromise.resolve();
                                                }.bind(this)
                                            }),
                                            new Button({
                                                text: "No",
                                                press: function () {
                                                    this.oConfirmEscapePreventDialog.close();
                                                    oPromise.reject();
                                                }.bind(this)
                                            })
                                        ]
                                    });
                                }
        
                                this.oConfirmEscapePreventDialog.open();
                            }.bind(this)
                        });
                    }
        
                    this.oEscapePreventDialog.open();
                }

    });
});