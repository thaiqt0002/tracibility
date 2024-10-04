<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="Tracibility.Controls.Header" %>

<!-- Left side -->
<div class="flex justify-between h-12 px-3 shadow-sm mb-3 select-none">
    <div class="flex gap-12 h-full">
        <div class="font-semibold text-2xl h-full flex items-center pb-px text-blue-900 cursor-pointer">Medtronic</div>
        <div class='flex gap-6 justify-center items-center text-sm'>
            <div id="HBtn1" class="h-full flex flex-col items-center justify-between group cursor-pointer">
                <div class="h-full flex justify-center items-center opacity-80 hover:text-blue-400">Home</div>
                <div class="h-px w-4/5 group-hover:bg-blue-400"></div>
            </div>
    <!-- Second Button -->
            <div class="h-full relative">
                <div id="HBtn2" class="h-full flex flex-col items-center justify-between group cursor-pointer text-sm">
                    <div class="h-full flex justify-center items-center select-none opacity-80 gap-0.5 hover:text-blue-400">
                        Phase 0
                        <div id="HImg2" class="opacity-80 flex w-4 transform transition-transform block duration-300">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m6 9 6 6 6-6"/></svg>
                        </div>
                    </div>
                    <div class="h-px w-full group-hover:bg-blue-400"></div>
                </div>
                <div id ="HDd2" class="z-10 absolute w-48 h-fit bg-white border-gray-100 border rounded-md top-14 -left-1 hidden py-2">
                    <div class="px-2 py-2 select-none cursor-pointer hover:bg-gray-200">1. Intialize Serial Number</div>
                    <div class="px-2 py-2 select-none cursor-pointer hover:bg-gray-200">2. Assign Batch</div>
                </div>
            </div>

    <!-- Third Button -->
    <div class="h-full relative">
                <div id="HBtn3" class="h-full flex flex-col items-center justify-between group cursor-pointer text-sm">
                    <div class="h-full flex justify-center items-center select-none opacity-80 gap-0.5 hover:text-blue-400">
                        Phase 1-2-3
                        <div id="HImg3" class="opacity-80 flex w-4 transform transition-transform block duration-300">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m6 9 6 6 6-6"/></svg>
                        </div>
                    </div>
                    <div class="h-px w-full group-hover:bg-blue-400"></div>
                </div>
                <div id ="HDd3" class="z-10 absolute w-48 h-fit bg-white border-gray-100 border rounded-md top-14 -left-1 hidden py-2">
                    <div class="px-2 py-2 select-none cursor-pointer hover:bg-gray-200">1. Assign Order</div>
                    <div class="px-2 py-2 select-none cursor-pointer hover:bg-gray-200">2. Assign Batch</div>
                </div>
            </div>
        </div>
    </div>

<!-- Right side -->
    <div class='flex gap-6'>
        <div class="h-full flex flex-col items-center justify-between group hover:text-blue-400 cursor-pointer text-sm">
            <div class="h-full flex justify-center items-center select-none opacity-80">User login</div>
            <div class="h-px w-4/5 group-hover:bg-blue-400"></div>
        </div>
        <div class="h-full flex flex-col items-center justify-between group hover:text-blue-400 cursor-pointer text-sm">
            <div class="h-full flex justify-center items-center select-none opacity-80">Sign up</div>
            <div class="h-px w-4/5 group-hover:bg-blue-400"></div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        let homeBtn = $("#homeBtn");
        let HBtn2 = $("#HBtn2");
        let HImg2 = $("#HImg2");
        let HDd2 = $("#HDd2");
        let HBtn3 = $("#HBtn3");
        let HImg3 = $("#HImg3");
        let HDd3 = $("#HDd3");

        $("#HBtn1").on("click", function() {
            window.location.href = "../InitializeSN.aspx";
        });

        HBtn2.on("click", function() {
            HImg2.toggleClass("rotate-180");
            HDd2.toggleClass("hidden");
        });

        HBtn3.on("click", function() {
            HImg3.toggleClass("rotate-180");
            HDd3.toggleClass("hidden");
        });

        $(document).on("click", function(event) {
            if (!HBtn2.is(event.target) && HBtn2.has(event.target).length === 0 && !HDd2.is(event.target) && HDd2.has(event.target).length === 0) {
                if (HImg2.hasClass("rotate-180")) {
                    HImg2.removeClass("rotate-180");
                    HDd2.addClass("hidden");
                }
            }
            if (!HBtn3.is(event.target) && HBtn3.has(event.target).length === 0 && !HDd3.is(event.target) && HDd3.has(event.target).length === 0) {
                if (HImg3.hasClass("rotate-180")) {
                    HImg3.removeClass("rotate-180");
                    HDd3.addClass("hidden");
                }
            }
        });
    });

</script>