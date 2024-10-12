function updateBranchCB()
{
    branchCBoxModel.clear();
    studyPeriodModel.clear();
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
    studyPeriodModel.clear();
    var jsondata = dbMan.getBranchStepsJson(branchId);
    for(var obj of jsondata)
    {
        stepCBoxModel.append({value : obj.id, text:  obj.step_name})
        stepCB.currentIndex = -1;
    }
}
function updateBasis(stepId)
{
    basisCBoxModel.clear();
    studyPeriodModel.clear();
    var jsondata = dbMan.getStepBasis(stepId);
    // b.id, b.step_id, b.basis_name, s.step_name,  br.city, br.branch_name
    var temp;
    for(var obj of jsondata)
    {
        temp = obj.branch_city + " - " + obj.branch_name;
        basisCBoxModel.append({ value: obj.id, text: obj.basis_name })
        basisCB.currentIndex = -1
    }
}
function updateStudyPeriod(basisId)
{
    studyPeriodModel.clear();
    var jsondata = dbMan.getBasisStudyPeriods(basisId);
    //p.id, p.basis_id, p.period, basis, step,  branch
    for(var obj of jsondata)
    {
        studyPeriodModel.append({Id: obj.id, BasisId: obj.basis_id, Period: obj.period, Basis: obj.basis, Step: obj.step, Branch: obj.branch  })
    }
}


function checkPeriodInsertEntries(Period)
{
    if(Period["basis_id"]  < 0)
    {
        periodInfoDialogId.dialogTitle = "خطا"
        periodInfoDialogId.dialogText = "انتخاب پایه به درستی صورت نگرفته است."
        periodInfoDialogId.dialogSuccess = false
        return false;
    }

    if(!Period["period"])
    {
        periodNameTF.placeholderText="ورود فیلد الزامی می‌باشد"
        periodNameTF.placeholderTextColor = "red"
        periodNameTF.focus = true;

        periodInfoDialogId.dialogTitle = "خطا"
        periodInfoDialogId.dialogText = "ورود سال تحصیلی الزامی می‌باشد"
        periodInfoDialogId.dialogSuccess = false
        return false;
    }

    return true;
}

function checkPeriodUpdateEntries(Period)
{
    if(Period["id"]  < 0)
    {
        periodInfoDialogId.dialogTitle = "خطا"
        periodInfoDialogId.dialogText = "انتخاب سال تحصیلی به درستی صورت نگرفته است."
        periodInfoDialogId.dialogSuccess = false
        return false;
    }

    if(!Period["period"])
    {
        periodInfoDialogId.placeholderText="ورود فیلد الزامی می‌باشد"
        periodInfoDialogId.placeholderTextColor = "red"
        periodInfoDialogId.focus = true;

        periodInfoDialogId.dialogTitle = "خطا"
        periodInfoDialogId.dialogText = "ورود سال تحصیلی الزامی می‌باشد"
        periodInfoDialogId.dialogSuccess = false
        return false;
    }

    return true;
}

function updateWidget(PeriodObj)
{
 studyPeriodDelegate.period = PeriodObj["period"];
}
