function updateBranchCB()
{
    branchCBoxModel.clear();
    var jsondata = dbMan.getBranchesJson();
    jsondata = JSON.parse(jsondata);
    //id, city, branch_name, address, description
    var temp;
    for(var obj of jsondata)
    {
        temp = obj.city + " - "+ obj.branch_name;
        branchCBoxModel.append({ value: obj.id, text: temp })
    }
}
function updateStepCB(branchId)
{
    stepCBoxModel.clear();
    var jsondata = dbMan.getBranchStepsJson(branchId);
    for(var obj of jsondata)
    {
        stepCBoxModel.append({value : obj.id, text:  obj.step_name})
    }
}
function updateBasis(stepId)
{
    basisModel.clear();
    var jsondata = dbMan.getStepBasis(stepId);
    // b.id, b.step_id, b.basis_name, s.step_name,  br.city, br.branch_name
    var temp;
    for(var obj of jsondata)
    {
        temp = obj.branch_city + " - " + obj.branch_name;
        basisModel.append({ Id: obj.id, StepId: obj.step_id, BasisName: obj.basis_name, Branch: temp , Step: obj.step_name })
    }
}


function checkBasisInsertEntries(Basis)
{
    if(Basis["step_id"]  < 0)
    {
        basisInfoDialogId.dialogTitle = "خطا"
        basisInfoDialogId.dialogText = "انتخاب پایه به درستی صورت نگرفته است."
        basisInfoDialogId.dialogSuccess = false
        return false;
    }

    if(!Basis["basis_name"])
    {
        basisNameTF.placeholderText="ورود فیلد الزامی می‌باشد"
        basisNameTF.placeholderTextColor = "red"
        basisNameTF.focus = true;

        basisInfoDialogId.dialogTitle = "خطا"
        basisInfoDialogId.dialogText = "ورود نام شهر الزامی می‌باشد"
        basisInfoDialogId.dialogSuccess = false
        return false;
    }

    return true;
}

function checkBasisUpdateEntries(Basis)
{
    if(Basis["id"]  < 0)
    {
        basisInfoDialogId.dialogTitle = "خطا"
        basisInfoDialogId.dialogText = "انتخاب پایه به درستی صورت نگرفته است."
        basisInfoDialogId.dialogSuccess = false
        return false;
    }

    if(!Basis["basis_name"])
    {
        basisNameTF.placeholderText="ورود فیلد الزامی می‌باشد"
        basisNameTF.placeholderTextColor = "red"
        basisNameTF.focus = true;

        basisInfoDialogId.dialogTitle = "خطا"
        basisInfoDialogId.dialogText = "ورود نام شهر الزامی می‌باشد"
        basisInfoDialogId.dialogSuccess = false
        return false;
    }

    return true;
}

function updateWidget(BasisObj)
{
    basisDelegate.basisName = BasisObj["basis_name"];
}
