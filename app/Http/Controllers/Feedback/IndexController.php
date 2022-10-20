<?php

namespace App\Http\Controllers\Feedback;

use App\Models\Feedback;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class IndexController extends Controller
{
    public function __invoke(Request $request){
        $this->authorize('feedback-policy', [Feedback::class]);
        $filter = $request->input('filter');
        if ($filter == null) {
            $feedbacks = Feedback::where('status', 'new')->get();
        } elseif ($filter == 'feedback') {
            $feedbacks = Feedback::where('parent_id', null)->where('status', 'new')->get();
        } elseif ($filter == 'reply') {
            $feedbacks = Feedback::where('parent_id', '<>', null)->where('status', 'new')->get();
        }

        return view('feedback.index', compact('feedbacks'));
    }
}
