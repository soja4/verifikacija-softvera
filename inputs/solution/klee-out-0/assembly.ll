; ModuleID = 'solution.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Enter parameter: \00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str2 = private unnamed_addr constant [30 x i8] c"That's the solution : x = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str4 = private unnamed_addr constant [11 x i8] c"solution.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [23 x i8] c"int main(int, char **)\00", align 1
@.str5 = private unnamed_addr constant [17 x i8] c"Not a solution!\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"klee_div_zero_check.c\00", align 1
@.str17 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str28 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str39 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str14 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str25 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1
@.str610 = private unnamed_addr constant [13 x i8] c"klee_range.c\00", align 1
@.str1711 = private unnamed_addr constant [14 x i8] c"invalid range\00", align 1
@.str2812 = private unnamed_addr constant [5 x i8] c"user\00", align 1

; Function Attrs: nounwind uwtable
define i32 @solve(i32 %x) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %x, i32* %2, align 4
  %3 = load i32* %2, align 4, !dbg !132
  %4 = icmp sgt i32 %3, 3, !dbg !132
  %5 = load i32* %2, align 4, !dbg !134
  %6 = sub nsw i32 %5, 1, !dbg !134
  %7 = icmp sgt i32 %6, 0, !dbg !134
  br i1 %4, label %8, label %14, !dbg !132

; <label>:8                                       ; preds = %0
  br i1 %7, label %9, label %13, !dbg !134

; <label>:9                                       ; preds = %8
  %10 = load i32* %2, align 4, !dbg !136
  %11 = mul nsw i32 2, %10, !dbg !136
  %12 = sub nsw i32 %11, 10, !dbg !136
  store i32 %12, i32* %1, !dbg !136
  br label %20, !dbg !136

; <label>:13                                      ; preds = %8
  store i32 -8, i32* %1, !dbg !137
  br label %20, !dbg !137

; <label>:14                                      ; preds = %0
  br i1 %7, label %15, label %16, !dbg !138

; <label>:15                                      ; preds = %14
  store i32 -4, i32* %1, !dbg !140
  br label %20, !dbg !140

; <label>:16                                      ; preds = %14
  %17 = load i32* %2, align 4, !dbg !141
  %18 = mul nsw i32 -2, %17, !dbg !141
  %19 = sub nsw i32 %18, 2, !dbg !141
  store i32 %19, i32* %1, !dbg !141
  br label %20, !dbg !141

; <label>:20                                      ; preds = %16, %15, %13, %9
  %21 = load i32* %1, !dbg !142
  ret i32 %21, !dbg !142
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %x = alloca i32, align 4
  %no = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str, i32 0, i32 0)), !dbg !143
  %5 = bitcast i32* %x to i8*, !dbg !144
  call void @klee_make_symbolic(i8* %5, i64 4, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0)), !dbg !144
  %6 = load i32* %x, align 4, !dbg !145
  %7 = call i32 @solve(i32 %6), !dbg !145
  store i32 %7, i32* %no, align 4, !dbg !145
  %8 = load i32* %no, align 4, !dbg !146
  %9 = icmp eq i32 %8, 0, !dbg !146
  br i1 %9, label %10, label %13, !dbg !146

; <label>:10                                      ; preds = %0
  %11 = load i32* %x, align 4, !dbg !148
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str2, i32 0, i32 0), i32 %11), !dbg !148
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str4, i32 0, i32 0), i32 35, i8* getelementptr inbounds ([23 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #7, !dbg !150
  unreachable, !dbg !150

; <label>:13                                      ; preds = %0
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str5, i32 0, i32 0)), !dbg !151
  %15 = load i32* %no, align 4, !dbg !153
  ret i32 %15, !dbg !153
}

declare i32 @printf(i8*, ...) #2

declare void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: nounwind uwtable
define void @klee_div_zero_check(i64 %z) #4 {
  %1 = icmp eq i64 %z, 0, !dbg !154
  br i1 %1, label %2, label %3, !dbg !154

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([22 x i8]* @.str6, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str28, i64 0, i64 0)) #8, !dbg !156
  unreachable, !dbg !156

; <label>:3                                       ; preds = %0
  ret void, !dbg !157
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #5

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @klee_int(i8* %name) #4 {
  %x = alloca i32, align 4
  %1 = bitcast i32* %x to i8*, !dbg !158
  call void @klee_make_symbolic(i8* %1, i64 4, i8* %name) #9, !dbg !158
  %2 = load i32* %x, align 4, !dbg !159, !tbaa !160
  ret i32 %2, !dbg !159
}

; Function Attrs: nounwind uwtable
define void @klee_overshift_check(i64 %bitWidth, i64 %shift) #4 {
  %1 = icmp ult i64 %shift, %bitWidth, !dbg !164
  br i1 %1, label %3, label %2, !dbg !164

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str39, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0)) #8, !dbg !166
  unreachable, !dbg !166

; <label>:3                                       ; preds = %0
  ret void, !dbg !168
}

; Function Attrs: nounwind uwtable
define i32 @klee_range(i32 %start, i32 %end, i8* %name) #4 {
  %x = alloca i32, align 4
  %1 = icmp slt i32 %start, %end, !dbg !169
  br i1 %1, label %3, label %2, !dbg !169

; <label>:2                                       ; preds = %0
  call void @klee_report_error(i8* getelementptr inbounds ([13 x i8]* @.str610, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str1711, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str2812, i64 0, i64 0)) #8, !dbg !171
  unreachable, !dbg !171

; <label>:3                                       ; preds = %0
  %4 = add nsw i32 %start, 1, !dbg !172
  %5 = icmp eq i32 %4, %end, !dbg !172
  br i1 %5, label %21, label %6, !dbg !172

; <label>:6                                       ; preds = %3
  %7 = bitcast i32* %x to i8*, !dbg !174
  call void @klee_make_symbolic(i8* %7, i64 4, i8* %name) #9, !dbg !174
  %8 = icmp eq i32 %start, 0, !dbg !176
  %9 = load i32* %x, align 4, !dbg !178, !tbaa !160
  br i1 %8, label %10, label %13, !dbg !176

; <label>:10                                      ; preds = %6
  %11 = icmp ult i32 %9, %end, !dbg !178
  %12 = zext i1 %11 to i64, !dbg !178
  call void @klee_assume(i64 %12) #9, !dbg !178
  br label %19, !dbg !180

; <label>:13                                      ; preds = %6
  %14 = icmp sge i32 %9, %start, !dbg !181
  %15 = zext i1 %14 to i64, !dbg !181
  call void @klee_assume(i64 %15) #9, !dbg !181
  %16 = load i32* %x, align 4, !dbg !183, !tbaa !160
  %17 = icmp slt i32 %16, %end, !dbg !183
  %18 = zext i1 %17 to i64, !dbg !183
  call void @klee_assume(i64 %18) #9, !dbg !183
  br label %19

; <label>:19                                      ; preds = %13, %10
  %20 = load i32* %x, align 4, !dbg !184, !tbaa !160
  br label %21, !dbg !184

; <label>:21                                      ; preds = %19, %3
  %.0 = phi i32 [ %20, %19 ], [ %start, %3 ]
  ret i32 %.0, !dbg !185
}

declare void @klee_assume(i64) #6

; Function Attrs: nounwind uwtable
define weak i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #4 {
  %1 = icmp eq i64 %len, 0, !dbg !186
  br i1 %1, label %._crit_edge, label %.lr.ph.preheader, !dbg !186

.lr.ph.preheader:                                 ; preds = %0
  %n.vec = and i64 %len, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %2 = add i64 %len, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep4 = getelementptr i8* %srcaddr, i64 %2
  %scevgep = getelementptr i8* %destaddr, i64 %2
  %bound1 = icmp uge i8* %scevgep, %srcaddr
  %bound0 = icmp uge i8* %scevgep4, %destaddr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %srcaddr, i64 %n.vec
  %ptr.ind.end6 = getelementptr i8* %destaddr, i64 %n.vec
  %rev.ind.end = sub i64 %len, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep103 = getelementptr i8* %destaddr, i64 %index
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !187
  %wide.load = load <16 x i8>* %3, align 1, !dbg !187
  %next.gep.sum279 = or i64 %index, 16, !dbg !187
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum279, !dbg !187
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !187
  %wide.load200 = load <16 x i8>* %5, align 1, !dbg !187
  %6 = bitcast i8* %next.gep103 to <16 x i8>*, !dbg !187
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !187
  %7 = getelementptr i8* %destaddr, i64 %next.gep.sum279, !dbg !187
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !187
  store <16 x i8> %wide.load200, <16 x i8>* %8, align 1, !dbg !187
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !188

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %srcaddr, %.lr.ph.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val5 = phi i8* [ %destaddr, %.lr.ph.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end6, %vector.body ]
  %resume.val7 = phi i64 [ %len, %.lr.ph.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %src.03 = phi i8* [ %11, %.lr.ph ], [ %resume.val, %middle.block ]
  %dest.02 = phi i8* [ %13, %.lr.ph ], [ %resume.val5, %middle.block ]
  %.01 = phi i64 [ %10, %.lr.ph ], [ %resume.val7, %middle.block ]
  %10 = add i64 %.01, -1, !dbg !186
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !187
  %12 = load i8* %src.03, align 1, !dbg !187, !tbaa !191
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !187
  store i8 %12, i8* %dest.02, align 1, !dbg !187, !tbaa !191
  %14 = icmp eq i64 %10, 0, !dbg !186
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !186, !llvm.loop !192

._crit_edge:                                      ; preds = %.lr.ph, %middle.block, %0
  ret i8* %destaddr, !dbg !193
}

; Function Attrs: nounwind uwtable
define weak i8* @memmove(i8* %dst, i8* %src, i64 %count) #4 {
  %1 = icmp eq i8* %src, %dst, !dbg !194
  br i1 %1, label %.loopexit, label %2, !dbg !194

; <label>:2                                       ; preds = %0
  %3 = icmp ugt i8* %src, %dst, !dbg !196
  br i1 %3, label %.preheader, label %18, !dbg !196

.preheader:                                       ; preds = %2
  %4 = icmp eq i64 %count, 0, !dbg !198
  br i1 %4, label %.loopexit, label %.lr.ph.preheader, !dbg !198

.lr.ph.preheader:                                 ; preds = %.preheader
  %n.vec = and i64 %count, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %5 = add i64 %count, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep11 = getelementptr i8* %src, i64 %5
  %scevgep = getelementptr i8* %dst, i64 %5
  %bound1 = icmp uge i8* %scevgep, %src
  %bound0 = icmp uge i8* %scevgep11, %dst
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %src, i64 %n.vec
  %ptr.ind.end13 = getelementptr i8* %dst, i64 %n.vec
  %rev.ind.end = sub i64 %count, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %src, i64 %index
  %next.gep110 = getelementptr i8* %dst, i64 %index
  %6 = bitcast i8* %next.gep to <16 x i8>*, !dbg !198
  %wide.load = load <16 x i8>* %6, align 1, !dbg !198
  %next.gep.sum586 = or i64 %index, 16, !dbg !198
  %7 = getelementptr i8* %src, i64 %next.gep.sum586, !dbg !198
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !198
  %wide.load207 = load <16 x i8>* %8, align 1, !dbg !198
  %9 = bitcast i8* %next.gep110 to <16 x i8>*, !dbg !198
  store <16 x i8> %wide.load, <16 x i8>* %9, align 1, !dbg !198
  %10 = getelementptr i8* %dst, i64 %next.gep.sum586, !dbg !198
  %11 = bitcast i8* %10 to <16 x i8>*, !dbg !198
  store <16 x i8> %wide.load207, <16 x i8>* %11, align 1, !dbg !198
  %index.next = add i64 %index, 32
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !200

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %src, %.lr.ph.preheader ], [ %src, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val12 = phi i8* [ %dst, %.lr.ph.preheader ], [ %dst, %vector.memcheck ], [ %ptr.ind.end13, %vector.body ]
  %resume.val14 = phi i64 [ %count, %.lr.ph.preheader ], [ %count, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %count
  br i1 %cmp.n, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %b.04 = phi i8* [ %14, %.lr.ph ], [ %resume.val, %middle.block ]
  %a.03 = phi i8* [ %16, %.lr.ph ], [ %resume.val12, %middle.block ]
  %.02 = phi i64 [ %13, %.lr.ph ], [ %resume.val14, %middle.block ]
  %13 = add i64 %.02, -1, !dbg !198
  %14 = getelementptr inbounds i8* %b.04, i64 1, !dbg !198
  %15 = load i8* %b.04, align 1, !dbg !198, !tbaa !191
  %16 = getelementptr inbounds i8* %a.03, i64 1, !dbg !198
  store i8 %15, i8* %a.03, align 1, !dbg !198, !tbaa !191
  %17 = icmp eq i64 %13, 0, !dbg !198
  br i1 %17, label %.loopexit, label %.lr.ph, !dbg !198, !llvm.loop !201

; <label>:18                                      ; preds = %2
  %19 = add i64 %count, -1, !dbg !202
  %20 = icmp eq i64 %count, 0, !dbg !204
  br i1 %20, label %.loopexit, label %.lr.ph9, !dbg !204

.lr.ph9:                                          ; preds = %18
  %21 = getelementptr inbounds i8* %src, i64 %19, !dbg !205
  %22 = getelementptr inbounds i8* %dst, i64 %19, !dbg !202
  %n.vec215 = and i64 %count, -32
  %cmp.zero217 = icmp eq i64 %n.vec215, 0
  br i1 %cmp.zero217, label %middle.block210, label %vector.memcheck224

vector.memcheck224:                               ; preds = %.lr.ph9
  %bound1221 = icmp ule i8* %21, %dst
  %bound0220 = icmp ule i8* %22, %src
  %memcheck.conflict223 = and i1 %bound0220, %bound1221
  %.sum = sub i64 %19, %n.vec215
  %rev.ptr.ind.end = getelementptr i8* %src, i64 %.sum
  %rev.ptr.ind.end229 = getelementptr i8* %dst, i64 %.sum
  %rev.ind.end231 = sub i64 %count, %n.vec215
  br i1 %memcheck.conflict223, label %middle.block210, label %vector.body209

vector.body209:                                   ; preds = %vector.body209, %vector.memcheck224
  %index212 = phi i64 [ %index.next234, %vector.body209 ], [ 0, %vector.memcheck224 ]
  %.sum440 = sub i64 %19, %index212
  %next.gep236.sum = add i64 %.sum440, -15, !dbg !204
  %23 = getelementptr i8* %src, i64 %next.gep236.sum, !dbg !204
  %24 = bitcast i8* %23 to <16 x i8>*, !dbg !204
  %wide.load434 = load <16 x i8>* %24, align 1, !dbg !204
  %reverse = shufflevector <16 x i8> %wide.load434, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !204
  %.sum505 = add i64 %.sum440, -31, !dbg !204
  %25 = getelementptr i8* %src, i64 %.sum505, !dbg !204
  %26 = bitcast i8* %25 to <16 x i8>*, !dbg !204
  %wide.load435 = load <16 x i8>* %26, align 1, !dbg !204
  %reverse436 = shufflevector <16 x i8> %wide.load435, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !204
  %reverse437 = shufflevector <16 x i8> %reverse, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !204
  %27 = getelementptr i8* %dst, i64 %next.gep236.sum, !dbg !204
  %28 = bitcast i8* %27 to <16 x i8>*, !dbg !204
  store <16 x i8> %reverse437, <16 x i8>* %28, align 1, !dbg !204
  %reverse438 = shufflevector <16 x i8> %reverse436, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !204
  %29 = getelementptr i8* %dst, i64 %.sum505, !dbg !204
  %30 = bitcast i8* %29 to <16 x i8>*, !dbg !204
  store <16 x i8> %reverse438, <16 x i8>* %30, align 1, !dbg !204
  %index.next234 = add i64 %index212, 32
  %31 = icmp eq i64 %index.next234, %n.vec215
  br i1 %31, label %middle.block210, label %vector.body209, !llvm.loop !206

middle.block210:                                  ; preds = %vector.body209, %vector.memcheck224, %.lr.ph9
  %resume.val225 = phi i8* [ %21, %.lr.ph9 ], [ %21, %vector.memcheck224 ], [ %rev.ptr.ind.end, %vector.body209 ]
  %resume.val227 = phi i8* [ %22, %.lr.ph9 ], [ %22, %vector.memcheck224 ], [ %rev.ptr.ind.end229, %vector.body209 ]
  %resume.val230 = phi i64 [ %count, %.lr.ph9 ], [ %count, %vector.memcheck224 ], [ %rev.ind.end231, %vector.body209 ]
  %new.indc.resume.val232 = phi i64 [ 0, %.lr.ph9 ], [ 0, %vector.memcheck224 ], [ %n.vec215, %vector.body209 ]
  %cmp.n233 = icmp eq i64 %new.indc.resume.val232, %count
  br i1 %cmp.n233, label %.loopexit, label %scalar.ph211

scalar.ph211:                                     ; preds = %scalar.ph211, %middle.block210
  %b.18 = phi i8* [ %33, %scalar.ph211 ], [ %resume.val225, %middle.block210 ]
  %a.17 = phi i8* [ %35, %scalar.ph211 ], [ %resume.val227, %middle.block210 ]
  %.16 = phi i64 [ %32, %scalar.ph211 ], [ %resume.val230, %middle.block210 ]
  %32 = add i64 %.16, -1, !dbg !204
  %33 = getelementptr inbounds i8* %b.18, i64 -1, !dbg !204
  %34 = load i8* %b.18, align 1, !dbg !204, !tbaa !191
  %35 = getelementptr inbounds i8* %a.17, i64 -1, !dbg !204
  store i8 %34, i8* %a.17, align 1, !dbg !204, !tbaa !191
  %36 = icmp eq i64 %32, 0, !dbg !204
  br i1 %36, label %.loopexit, label %scalar.ph211, !dbg !204, !llvm.loop !207

.loopexit:                                        ; preds = %scalar.ph211, %middle.block210, %18, %.lr.ph, %middle.block, %.preheader, %0
  ret i8* %dst, !dbg !208
}

; Function Attrs: nounwind uwtable
define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #4 {
  %1 = icmp eq i64 %len, 0, !dbg !209
  br i1 %1, label %15, label %.lr.ph.preheader, !dbg !209

.lr.ph.preheader:                                 ; preds = %0
  %n.vec = and i64 %len, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %2 = add i64 %len, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep5 = getelementptr i8* %srcaddr, i64 %2
  %scevgep4 = getelementptr i8* %destaddr, i64 %2
  %bound1 = icmp uge i8* %scevgep4, %srcaddr
  %bound0 = icmp uge i8* %scevgep5, %destaddr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %srcaddr, i64 %n.vec
  %ptr.ind.end7 = getelementptr i8* %destaddr, i64 %n.vec
  %rev.ind.end = sub i64 %len, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep104 = getelementptr i8* %destaddr, i64 %index
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !210
  %wide.load = load <16 x i8>* %3, align 1, !dbg !210
  %next.gep.sum280 = or i64 %index, 16, !dbg !210
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum280, !dbg !210
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !210
  %wide.load201 = load <16 x i8>* %5, align 1, !dbg !210
  %6 = bitcast i8* %next.gep104 to <16 x i8>*, !dbg !210
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !210
  %7 = getelementptr i8* %destaddr, i64 %next.gep.sum280, !dbg !210
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !210
  store <16 x i8> %wide.load201, <16 x i8>* %8, align 1, !dbg !210
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !211

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %srcaddr, %.lr.ph.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val6 = phi i8* [ %destaddr, %.lr.ph.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end7, %vector.body ]
  %resume.val8 = phi i64 [ %len, %.lr.ph.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %src.03 = phi i8* [ %11, %.lr.ph ], [ %resume.val, %middle.block ]
  %dest.02 = phi i8* [ %13, %.lr.ph ], [ %resume.val6, %middle.block ]
  %.01 = phi i64 [ %10, %.lr.ph ], [ %resume.val8, %middle.block ]
  %10 = add i64 %.01, -1, !dbg !209
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !210
  %12 = load i8* %src.03, align 1, !dbg !210, !tbaa !191
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !210
  store i8 %12, i8* %dest.02, align 1, !dbg !210, !tbaa !191
  %14 = icmp eq i64 %10, 0, !dbg !209
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !209, !llvm.loop !212

._crit_edge:                                      ; preds = %.lr.ph, %middle.block
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %15, !dbg !209

; <label>:15                                      ; preds = %._crit_edge, %0
  %dest.0.lcssa = phi i8* [ %scevgep, %._crit_edge ], [ %destaddr, %0 ]
  ret i8* %dest.0.lcssa, !dbg !213
}

; Function Attrs: nounwind uwtable
define weak i8* @memset(i8* %dst, i32 %s, i64 %count) #4 {
  %1 = icmp eq i64 %count, 0, !dbg !214
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !214

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !215
  br label %3, !dbg !214

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.02 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.01 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.01, -1, !dbg !214
  %5 = getelementptr inbounds i8* %a.02, i64 1, !dbg !215
  store volatile i8 %2, i8* %a.02, align 1, !dbg !215, !tbaa !191
  %6 = icmp eq i64 %4, 0, !dbg !214
  br i1 %6, label %._crit_edge, label %3, !dbg !214

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !216
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-floa
attributes #4 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn nounwind }
attributes #8 = { nobuiltin noreturn nounwind }
attributes #9 = { nobuiltin nounwind }

!llvm.dbg.cu = !{!0, !15, !26, !39, !51, !64, !83, !98, !113}
!llvm.module.flags = !{!129, !130}
!llvm.ident = !{!131, !131, !131, !131, !131, !131, !131, !131, !131}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.4.2 (tags/RELEASE_342/final)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/jana
!1 = metadata !{metadata !"solution.c", metadata !"/home/jana/Desktop/verifikacija-softvera/inputs/solution"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"solve", metadata !"solve", metadata !"", i32 10, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @solve, null, null, metadata !2, i32 10} ; [ DW_TAG_subpro
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/jana/Desktop/verifikacija-softvera/inputs/solution/solution.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 26, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 26} ; [ DW_TAG_su
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8, metadata !8, metadata !12}
!12 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!13 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!14 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!15 = metadata !{i32 786449, metadata !16, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_342/final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !17, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/jan
!16 = metadata !{metadata !"/home/jana/klee/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/jana/klee/runtime/Intrinsic"}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 786478, metadata !19, metadata !20, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", i32 12, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_check, null
!19 = metadata !{metadata !"klee_div_zero_check.c", metadata !"/home/jana/klee/runtime/Intrinsic"}
!20 = metadata !{i32 786473, metadata !19}        ; [ DW_TAG_file_type ] [/home/jana/klee/runtime/Intrinsic/klee_div_zero_check.c]
!21 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = metadata !{null, metadata !23}
!23 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!24 = metadata !{metadata !25}
!25 = metadata !{i32 786689, metadata !18, metadata !"z", metadata !20, i32 16777228, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!26 = metadata !{i32 786449, metadata !27, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_342/final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !28, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/jan
!27 = metadata !{metadata !"/home/jana/klee/runtime/Intrinsic/klee_int.c", metadata !"/home/jana/klee/runtime/Intrinsic"}
!28 = metadata !{metadata !29}
!29 = metadata !{i32 786478, metadata !30, metadata !31, metadata !"klee_int", metadata !"klee_int", metadata !"", i32 13, metadata !32, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int, null, null, metadata !36, i32 13} ; [ 
!30 = metadata !{metadata !"klee_int.c", metadata !"/home/jana/klee/runtime/Intrinsic"}
!31 = metadata !{i32 786473, metadata !30}        ; [ DW_TAG_file_type ] [/home/jana/klee/runtime/Intrinsic/klee_int.c]
!32 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !33, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!33 = metadata !{metadata !8, metadata !34}
!34 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !35} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!35 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!36 = metadata !{metadata !37, metadata !38}
!37 = metadata !{i32 786689, metadata !29, metadata !"name", metadata !31, i32 16777229, metadata !34, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!38 = metadata !{i32 786688, metadata !29, metadata !"x", metadata !31, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!39 = metadata !{i32 786449, metadata !40, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_342/final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !41, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/jan
!40 = metadata !{metadata !"/home/jana/klee/runtime/Intrinsic/klee_overshift_check.c", metadata !"/home/jana/klee/runtime/Intrinsic"}
!41 = metadata !{metadata !42}
!42 = metadata !{i32 786478, metadata !43, metadata !44, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"", i32 20, metadata !45, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64, i64)* @klee_overshift_che
!43 = metadata !{metadata !"klee_overshift_check.c", metadata !"/home/jana/klee/runtime/Intrinsic"}
!44 = metadata !{i32 786473, metadata !43}        ; [ DW_TAG_file_type ] [/home/jana/klee/runtime/Intrinsic/klee_overshift_check.c]
!45 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !46, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!46 = metadata !{null, metadata !47, metadata !47}
!47 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!48 = metadata !{metadata !49, metadata !50}
!49 = metadata !{i32 786689, metadata !42, metadata !"bitWidth", metadata !44, i32 16777236, metadata !47, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bitWidth] [line 20]
!50 = metadata !{i32 786689, metadata !42, metadata !"shift", metadata !44, i32 33554452, metadata !47, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [shift] [line 20]
!51 = metadata !{i32 786449, metadata !52, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_342/final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !53, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/jan
!52 = metadata !{metadata !"/home/jana/klee/runtime/Intrinsic/klee_range.c", metadata !"/home/jana/klee/runtime/Intrinsic"}
!53 = metadata !{metadata !54}
!54 = metadata !{i32 786478, metadata !55, metadata !56, metadata !"klee_range", metadata !"klee_range", metadata !"", i32 13, metadata !57, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range, null, null, metadata !
!55 = metadata !{metadata !"klee_range.c", metadata !"/home/jana/klee/runtime/Intrinsic"}
!56 = metadata !{i32 786473, metadata !55}        ; [ DW_TAG_file_type ] [/home/jana/klee/runtime/Intrinsic/klee_range.c]
!57 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !58, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = metadata !{metadata !8, metadata !8, metadata !8, metadata !34}
!59 = metadata !{metadata !60, metadata !61, metadata !62, metadata !63}
!60 = metadata !{i32 786689, metadata !54, metadata !"start", metadata !56, i32 16777229, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 13]
!61 = metadata !{i32 786689, metadata !54, metadata !"end", metadata !56, i32 33554445, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [end] [line 13]
!62 = metadata !{i32 786689, metadata !54, metadata !"name", metadata !56, i32 50331661, metadata !34, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!63 = metadata !{i32 786688, metadata !54, metadata !"x", metadata !56, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!64 = metadata !{i32 786449, metadata !65, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_342/final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !66, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/jan
!65 = metadata !{metadata !"/home/jana/klee/runtime/Intrinsic/memcpy.c", metadata !"/home/jana/klee/runtime/Intrinsic"}
!66 = metadata !{metadata !67}
!67 = metadata !{i32 786478, metadata !68, metadata !69, metadata !"memcpy", metadata !"memcpy", metadata !"", i32 12, metadata !70, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !77, i32 12} 
!68 = metadata !{metadata !"memcpy.c", metadata !"/home/jana/klee/runtime/Intrinsic"}
!69 = metadata !{i32 786473, metadata !68}        ; [ DW_TAG_file_type ] [/home/jana/klee/runtime/Intrinsic/memcpy.c]
!70 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !71, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!71 = metadata !{metadata !72, metadata !72, metadata !73, metadata !75}
!72 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!73 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !74} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!74 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!75 = metadata !{i32 786454, metadata !68, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !76} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!76 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!77 = metadata !{metadata !78, metadata !79, metadata !80, metadata !81, metadata !82}
!78 = metadata !{i32 786689, metadata !67, metadata !"destaddr", metadata !69, i32 16777228, metadata !72, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!79 = metadata !{i32 786689, metadata !67, metadata !"srcaddr", metadata !69, i32 33554444, metadata !73, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!80 = metadata !{i32 786689, metadata !67, metadata !"len", metadata !69, i32 50331660, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!81 = metadata !{i32 786688, metadata !67, metadata !"dest", metadata !69, i32 13, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!82 = metadata !{i32 786688, metadata !67, metadata !"src", metadata !69, i32 14, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!83 = metadata !{i32 786449, metadata !84, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_342/final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !85, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/jan
!84 = metadata !{metadata !"/home/jana/klee/runtime/Intrinsic/memmove.c", metadata !"/home/jana/klee/runtime/Intrinsic"}
!85 = metadata !{metadata !86}
!86 = metadata !{i32 786478, metadata !87, metadata !88, metadata !"memmove", metadata !"memmove", metadata !"", i32 12, metadata !89, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memmove, null, null, metadata !92, i32 1
!87 = metadata !{metadata !"memmove.c", metadata !"/home/jana/klee/runtime/Intrinsic"}
!88 = metadata !{i32 786473, metadata !87}        ; [ DW_TAG_file_type ] [/home/jana/klee/runtime/Intrinsic/memmove.c]
!89 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !90, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!90 = metadata !{metadata !72, metadata !72, metadata !73, metadata !91}
!91 = metadata !{i32 786454, metadata !87, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !76} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!92 = metadata !{metadata !93, metadata !94, metadata !95, metadata !96, metadata !97}
!93 = metadata !{i32 786689, metadata !86, metadata !"dst", metadata !88, i32 16777228, metadata !72, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!94 = metadata !{i32 786689, metadata !86, metadata !"src", metadata !88, i32 33554444, metadata !73, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!95 = metadata !{i32 786689, metadata !86, metadata !"count", metadata !88, i32 50331660, metadata !91, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!96 = metadata !{i32 786688, metadata !86, metadata !"a", metadata !88, i32 13, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!97 = metadata !{i32 786688, metadata !86, metadata !"b", metadata !88, i32 14, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 14]
!98 = metadata !{i32 786449, metadata !99, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_342/final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !100, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/ja
!99 = metadata !{metadata !"/home/jana/klee/runtime/Intrinsic/mempcpy.c", metadata !"/home/jana/klee/runtime/Intrinsic"}
!100 = metadata !{metadata !101}
!101 = metadata !{i32 786478, metadata !102, metadata !103, metadata !"mempcpy", metadata !"mempcpy", metadata !"", i32 11, metadata !104, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy, null, null, metadata !107, 
!102 = metadata !{metadata !"mempcpy.c", metadata !"/home/jana/klee/runtime/Intrinsic"}
!103 = metadata !{i32 786473, metadata !102}      ; [ DW_TAG_file_type ] [/home/jana/klee/runtime/Intrinsic/mempcpy.c]
!104 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !105, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!105 = metadata !{metadata !72, metadata !72, metadata !73, metadata !106}
!106 = metadata !{i32 786454, metadata !102, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !76} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!107 = metadata !{metadata !108, metadata !109, metadata !110, metadata !111, metadata !112}
!108 = metadata !{i32 786689, metadata !101, metadata !"destaddr", metadata !103, i32 16777227, metadata !72, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 11]
!109 = metadata !{i32 786689, metadata !101, metadata !"srcaddr", metadata !103, i32 33554443, metadata !73, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 11]
!110 = metadata !{i32 786689, metadata !101, metadata !"len", metadata !103, i32 50331659, metadata !106, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 11]
!111 = metadata !{i32 786688, metadata !101, metadata !"dest", metadata !103, i32 12, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 12]
!112 = metadata !{i32 786688, metadata !101, metadata !"src", metadata !103, i32 13, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 13]
!113 = metadata !{i32 786449, metadata !114, i32 1, metadata !"clang version 3.4.2 (tags/RELEASE_342/final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !115, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/
!114 = metadata !{metadata !"/home/jana/klee/runtime/Intrinsic/memset.c", metadata !"/home/jana/klee/runtime/Intrinsic"}
!115 = metadata !{metadata !116}
!116 = metadata !{i32 786478, metadata !117, metadata !118, metadata !"memset", metadata !"memset", metadata !"", i32 11, metadata !119, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !122, i32
!117 = metadata !{metadata !"memset.c", metadata !"/home/jana/klee/runtime/Intrinsic"}
!118 = metadata !{i32 786473, metadata !117}      ; [ DW_TAG_file_type ] [/home/jana/klee/runtime/Intrinsic/memset.c]
!119 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !120, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!120 = metadata !{metadata !72, metadata !72, metadata !8, metadata !121}
!121 = metadata !{i32 786454, metadata !117, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !76} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!122 = metadata !{metadata !123, metadata !124, metadata !125, metadata !126}
!123 = metadata !{i32 786689, metadata !116, metadata !"dst", metadata !118, i32 16777227, metadata !72, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 11]
!124 = metadata !{i32 786689, metadata !116, metadata !"s", metadata !118, i32 33554443, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 11]
!125 = metadata !{i32 786689, metadata !116, metadata !"count", metadata !118, i32 50331659, metadata !121, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 11]
!126 = metadata !{i32 786688, metadata !116, metadata !"a", metadata !118, i32 12, metadata !127, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 12]
!127 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !128} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!128 = metadata !{i32 786485, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!129 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!130 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!131 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_342/final)"}
!132 = metadata !{i32 12, i32 0, metadata !133, null}
!133 = metadata !{i32 786443, metadata !1, metadata !4, i32 12, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/jana/Desktop/verifikacija-softvera/inputs/solution/solution.c]
!134 = metadata !{i32 13, i32 0, metadata !135, null}
!135 = metadata !{i32 786443, metadata !1, metadata !133, i32 13, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/jana/Desktop/verifikacija-softvera/inputs/solution/solution.c]
!136 = metadata !{i32 14, i32 0, metadata !135, null}
!137 = metadata !{i32 16, i32 0, metadata !135, null}
!138 = metadata !{i32 18, i32 0, metadata !139, null}
!139 = metadata !{i32 786443, metadata !1, metadata !133, i32 18, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/jana/Desktop/verifikacija-softvera/inputs/solution/solution.c]
!140 = metadata !{i32 19, i32 0, metadata !139, null}
!141 = metadata !{i32 21, i32 0, metadata !139, null}
!142 = metadata !{i32 24, i32 0, metadata !4, null}
!143 = metadata !{i32 29, i32 0, metadata !9, null}
!144 = metadata !{i32 30, i32 0, metadata !9, null}
!145 = metadata !{i32 31, i32 0, metadata !9, null}
!146 = metadata !{i32 33, i32 0, metadata !147, null}
!147 = metadata !{i32 786443, metadata !1, metadata !9, i32 33, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/jana/Desktop/verifikacija-softvera/inputs/solution/solution.c]
!148 = metadata !{i32 34, i32 0, metadata !149, null}
!149 = metadata !{i32 786443, metadata !1, metadata !147, i32 33, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/jana/Desktop/verifikacija-softvera/inputs/solution/solution.c]
!150 = metadata !{i32 35, i32 0, metadata !149, null}
!151 = metadata !{i32 38, i32 0, metadata !152, null}
!152 = metadata !{i32 786443, metadata !1, metadata !147, i32 37, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/jana/Desktop/verifikacija-softvera/inputs/solution/solution.c]
!153 = metadata !{i32 41, i32 0, metadata !9, null}
!154 = metadata !{i32 13, i32 0, metadata !155, null}
!155 = metadata !{i32 786443, metadata !19, metadata !18, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/jana/klee/runtime/Intrinsic/klee_div_zero_check.c]
!156 = metadata !{i32 14, i32 0, metadata !155, null}
!157 = metadata !{i32 15, i32 0, metadata !18, null}
!158 = metadata !{i32 15, i32 0, metadata !29, null}
!159 = metadata !{i32 16, i32 0, metadata !29, null}
!160 = metadata !{metadata !161, metadata !161, i64 0}
!161 = metadata !{metadata !"int", metadata !162, i64 0}
!162 = metadata !{metadata !"omnipotent char", metadata !163, i64 0}
!163 = metadata !{metadata !"Simple C/C++ TBAA"}
!164 = metadata !{i32 21, i32 0, metadata !165, null}
!165 = metadata !{i32 786443, metadata !43, metadata !42, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/jana/klee/runtime/Intrinsic/klee_overshift_check.c]
!166 = metadata !{i32 27, i32 0, metadata !167, null}
!167 = metadata !{i32 786443, metadata !43, metadata !165, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/jana/klee/runtime/Intrinsic/klee_overshift_check.c]
!168 = metadata !{i32 29, i32 0, metadata !42, null}
!169 = metadata !{i32 16, i32 0, metadata !170, null}
!170 = metadata !{i32 786443, metadata !55, metadata !54, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/jana/klee/runtime/Intrinsic/klee_range.c]
!171 = metadata !{i32 17, i32 0, metadata !170, null}
!172 = metadata !{i32 19, i32 0, metadata !173, null}
!173 = metadata !{i32 786443, metadata !55, metadata !54, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/jana/klee/runtime/Intrinsic/klee_range.c]
!174 = metadata !{i32 22, i32 0, metadata !175, null}
!175 = metadata !{i32 786443, metadata !55, metadata !173, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/jana/klee/runtime/Intrinsic/klee_range.c]
!176 = metadata !{i32 25, i32 0, metadata !177, null}
!177 = metadata !{i32 786443, metadata !55, metadata !175, i32 25, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/jana/klee/runtime/Intrinsic/klee_range.c]
!178 = metadata !{i32 26, i32 0, metadata !179, null}
!179 = metadata !{i32 786443, metadata !55, metadata !177, i32 25, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/jana/klee/runtime/Intrinsic/klee_range.c]
!180 = metadata !{i32 27, i32 0, metadata !179, null}
!181 = metadata !{i32 28, i32 0, metadata !182, null}
!182 = metadata !{i32 786443, metadata !55, metadata !177, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/jana/klee/runtime/Intrinsic/klee_range.c]
!183 = metadata !{i32 29, i32 0, metadata !182, null}
!184 = metadata !{i32 32, i32 0, metadata !175, null}
!185 = metadata !{i32 34, i32 0, metadata !54, null}
!186 = metadata !{i32 16, i32 0, metadata !67, null}
!187 = metadata !{i32 17, i32 0, metadata !67, null}
!188 = metadata !{metadata !188, metadata !189, metadata !190}
!189 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!190 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!191 = metadata !{metadata !162, metadata !162, i64 0}
!192 = metadata !{metadata !192, metadata !189, metadata !190}
!193 = metadata !{i32 18, i32 0, metadata !67, null}
!194 = metadata !{i32 16, i32 0, metadata !195, null}
!195 = metadata !{i32 786443, metadata !87, metadata !86, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/jana/klee/runtime/Intrinsic/memmove.c]
!196 = metadata !{i32 19, i32 0, metadata !197, null}
!197 = metadata !{i32 786443, metadata !87, metadata !86, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/jana/klee/runtime/Intrinsic/memmove.c]
!198 = metadata !{i32 20, i32 0, metadata !199, null}
!199 = metadata !{i32 786443, metadata !87, metadata !197, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/jana/klee/runtime/Intrinsic/memmove.c]
!200 = metadata !{metadata !200, metadata !189, metadata !190}
!201 = metadata !{metadata !201, metadata !189, metadata !190}
!202 = metadata !{i32 22, i32 0, metadata !203, null}
!203 = metadata !{i32 786443, metadata !87, metadata !197, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/jana/klee/runtime/Intrinsic/memmove.c]
!204 = metadata !{i32 24, i32 0, metadata !203, null}
!205 = metadata !{i32 23, i32 0, metadata !203, null}
!206 = metadata !{metadata !206, metadata !189, metadata !190}
!207 = metadata !{metadata !207, metadata !189, metadata !190}
!208 = metadata !{i32 28, i32 0, metadata !86, null}
!209 = metadata !{i32 15, i32 0, metadata !101, null}
!210 = metadata !{i32 16, i32 0, metadata !101, null}
!211 = metadata !{metadata !211, metadata !189, metadata !190}
!212 = metadata !{metadata !212, metadata !189, metadata !190}
!213 = metadata !{i32 17, i32 0, metadata !101, null}
!214 = metadata !{i32 13, i32 0, metadata !116, null}
!215 = metadata !{i32 14, i32 0, metadata !116, null}
!216 = metadata !{i32 15, i32 0, metadata !116, null}
