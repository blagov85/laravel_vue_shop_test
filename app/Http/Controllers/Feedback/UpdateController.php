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
        $ids = [];
        foreach ($filter as $i => $value){
            if($value == 'active'){
                array_push($ids, $i);
            }
        }
        //dd($ids);
        Feedback::whereIn('id', $ids)->update(['status'=>'active']);
        return redirect()->route('feedback.index');
    }
}
