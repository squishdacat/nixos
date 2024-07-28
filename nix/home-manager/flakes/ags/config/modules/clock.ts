const date = Variable("", {
    poll: [1000, 'date "+%X %b%e (%a)"'],
})


export function Clock() {
    return Widget.Label({
        class_name: "clock",
        label: date.bind(),
    })
}

