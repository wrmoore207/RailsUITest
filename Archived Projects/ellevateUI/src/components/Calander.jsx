"use client";

import { SchedulerProvider, SchedularView } from "mina-scheduler";

// Example of setting initial events
const events = [
  {
    id: "1d4c5c73-b5fa-4f67-bb6e-1d5d66cbd57d",
    title: "Kickoff Meeting",
    description: "Initial project kickoff with stakeholders.",
    startDate: new Date(),
    endDate: new Date(new Date().getTime() + 60 * 60 * 1000),
    variant: "primary",
  },
];

const Calendar = () => {
  return (
    <section className="flex w-full flex-col items-center justify-center gap-4 py-8 md:py-10">
      <SchedulerProvider initialState={events}>
        <SchedularView
          views={["day", "week", "month"]}
          mobileViews={["day"]}
          classNames={{
            buttons: {
              addEvent: "bg-red-500",
              next: "bg-blue-500",
              prev: "bg-green-500",
            },
          }}
        />
      </SchedulerProvider>
    </section>
  );
};

export default Calendar;
