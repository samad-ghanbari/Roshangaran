function updateBranches()
{
    branchesModel.clear();
    var jsondata = dbMan.getBranchesJson();
    jsondata = JSON.parse(jsondata);
    //id, city, branch_name, address, description
    for(var obj of jsondata)
    {
        branchesModel.append({ Id: obj.id, City: obj.city, Name: obj.branch_name, Address: obj.address, Description: obj.description })
    }
}

function checkBranchEntries(Branch)
{
    if(!Branch["branch_name"])
    {
        branchNameTF.placeholderText="ورود فیلد الزامی می‌باشد"
        branchNameTF.placeholderTextColor = "red"
        branchNameTF.focus = true;

        branchInfoDialogId.dialogTitle = "خطا"
        branchInfoDialogId.dialogText = "ورود نام شعبه الزامی می‌باشد"
        branchInfoDialogId.dialogSuccess = false
        return false;
    }

    if(!Branch["city"])
    {
        branchCityTF.placeholderText="ورود فیلد الزامی می‌باشد"
        branchCityTF.placeholderTextColor = "red"
        branchCityTF.focus = true;

        branchInfoDialogId.dialogTitle = "خطا"
        branchInfoDialogId.dialogText = "ورود نام شهر الزامی می‌باشد"
        branchInfoDialogId.dialogSuccess = false
        return false;
    }

    if(!Branch["address"])
    {
        branchAddressTF.placeholderText="ورود فیلد الزامی می‌باشد"
        branchAddressTF.placeholderTextColor = "red"
        branchAddressTF.focus = true;

        branchInfoDialogId.dialogTitle = "خطا"
        branchInfoDialogId.dialogText = "ورود آدرس الزامی می‌باشد"
        branchInfoDialogId.dialogSuccess = false
        return false;
    }

    return true;
}


function updateWidget(branchObj)
{
    branchDelegate.branchCity = branchObj["city"];
    branchDelegate.branchName = branchObj["branch_name"];
    branchDelegate.branchDescription = branchObj["description"];
    branchDelegate.branchAddress = branchObj["address"];

}
