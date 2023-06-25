<?php

namespace App\Http\Controllers\Feedback;

use App\Models\Feedback;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class UpdateController extends Controller
{
    public function __invoke(Request $request){
        $this->authorize('feedback-policy', [Feedback::class]);
        $filter = $request->input('action');
        $idsUpdate = [];
        $idsDelete = [];
        foreach ($filter as $i => $value){
            if($value == 'active'){
                array_push($idsUpdate, $i);
            }
            if($value == 'delete'){
                array_push($idsDelete, $i);
            }
        }
        try{
            DB::beginTransaction();
            Feedback::whereIn('id', $idsUpdate)->update(['status'=>'active']);
            Feedback::whereIn('id', $idsDelete)->delete();
            DB::commit();
        }catch(Exception $exception){
            DB::rollback();
            return back();
        }
        
        return redirect()->route('feedback.index');
    }
}
