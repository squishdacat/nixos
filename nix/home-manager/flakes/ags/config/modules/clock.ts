const date = Variable("", {
    //poll: [1000, 'date "+%X %b%e (%a)"'],
    poll: [1000, 'date +"%x %X (%a)"'],
})


export function Clock() {
    return Widget.Label({
        class_name: "clock",
        label: date.bind(),
    })
}

